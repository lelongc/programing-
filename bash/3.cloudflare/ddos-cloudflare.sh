#!/bin/bash

###
# Automating your CloudFlare DDoS Protection by https://bobbyiliev.com
###

set -euo pipefail

# Configuration
readonly CF_CONFIG_FILE="${HOME}/.cloudflare/config" # để root cho dùng crontab cũng được
readonly CF_LOG_FILE="${HOME}/.cloudflare/ddos.log"
readonly TEMP_DIR="/tmp"

# CloudFlare API Configuration
CF_ZONE_ID=${CF_ZONE_ID:-"338b1ae561413077b3d7cebfc7fb15ed"}
CF_API_TOKEN=${CF_API_TOKEN:-"7oSrlYAVk-8MYNdn8dVPDZ58DnMXjznUfrspzaSI"}
CF_EMAIL_ADDRESS=${CF_EMAIL_ADDRESS:-"lelong190110@gmail.com"}

# Settings
readonly NOTIFICATIONS_ENABLED=${notifications:-1}
readonly API_ENDPOINT="https://api.cloudflare.com/client/v4/zones/${CF_ZONE_ID}/settings/security_level"

# Logging function
# log() {
#     local message="$(date '+%Y-%m-%d %H:%M:%S') - $1"
#     echo "$message" >>"$CF_LOG_FILE"
#     [ "$NOTIFICATIONS_ENABLED" -eq 1 ] && echo -e "Subject: CloudFlare DDoS Protection: $1\n\n$message" | msmtp "$CF_EMAIL_ADDRESS"
# }
# gửi file kèm
log() {
    # Tạo thông điệp với thời gian
    local message="$(date '+%Y-%m-%d %H:%M:%S') - $1"
    
    # Ghi thông điệp vào tệp log
    echo "$message" >>"$CF_LOG_FILE"
    
    # Lưu thông tin hệ thống vào tệp htop_report.txt dưới dạng văn bản
    top -b -n 1 > /root/.cloudflare/htop_report.txt

    # Chuyển đổi văn bản từ top thành HTML bằng aha
    cat /root/.cloudflare/htop_report.txt | aha > /root/.cloudflare/htop_report.html

    # Kiểm tra nếu tính năng thông báo được bật
    if [ "$NOTIFICATIONS_ENABLED" -eq 1 ]; then
        # Kiểm tra xem tệp đính kèm có tồn tại và gửi email với tệp đính kèm nếu có
        if [ -f "/root/.cloudflare/htop_report.html" ]; then
            # Gửi email với tệp đính kèm htop_report.html
            echo "$message" | mutt -s "CloudFlare DDoS Protection: $1" -a "/root/.cloudflare/htop_report.html" -- "$CF_EMAIL_ADDRESS"
        else
            # Nếu không có tệp đính kèm, gửi email bình thường
            echo "$message" | mutt -s "CloudFlare DDoS Protection: $1" -- "$CF_EMAIL_ADDRESS"
        fi
    fi
}





# Error handling
error_exit() {
    log "ERROR: $1"
    exit 1
}

# Validate configuration
# Validate configuration
validate_config() {
    if [ -z "${CF_ZONE_ID}" ]; then
        error_exit "CF_ZONE_ID is empty"
    fi

    if [ -z "${CF_API_TOKEN}" ]; then
        error_exit "CF_API_TOKEN is empty"
    fi

    if [ "${CF_ZONE_ID}" = "YOUR_CF_ZONE_ID" ]; then
        error_exit "CF_ZONE_ID has default value"
    fi

    if [ "${CF_API_TOKEN}" = "YOUR_CF_API_TOKEN" ]; then
        error_exit "CF_API_TOKEN has default value"
    fi
}

# Initialize CloudFlare directory
init_cloudflare_dir() {
    local cf_dir="${HOME}/.cloudflare"
    if ! [ -d "$cf_dir" ]; then
        mkdir -p "$cf_dir" || error_exit "Failed to create CloudFlare directory"
        chmod 700 "$cf_dir" || error_exit "Failed to set permissions on CloudFlare directory"
    fi
}

# Get current CloudFlare security status
get_security_status() {
    local response
    local status

    response=$(curl -sS -X GET "$API_ENDPOINT" \
        -H "Authorization: Bearer ${CF_API_TOKEN}" \
        -H "Content-Type: application/json")

    status=$(echo "${response}" | jq -r '.result.value')

    if [ -z "${status}" ]; then
        error_exit "Failed to get status from CloudFlare"
    fi

    echo "${status}"
}

# Get system CPU load
get_cpu_load() {
    # Test mode - simulated load
    if [ "${TEST_MODE:-0}" = "1" ]; then
        local simulated_load="${SIMULATED_LOAD:-0}"
        echo "Debug - Simulated load: ${simulated_load}" >&2
        echo "${simulated_load}"
        return
    fi

    # Normal mode
    local load
    load=$(uptime | awk -F'load average:' '{ print $2 }' | awk '{print $1}' | sed 's/,//' | xargs printf "%.0f")
    echo "Debug - Raw load: ${load}" >&2
    echo "${load}"
}

# Calculate allowed CPU load
get_allowed_cpu_load() {
    local cpu_count
    cpu_count=$(nproc)
    local average=$((cpu_count / 2))
    [ "$average" -eq 0 ] && average=1
    echo "Debug - CPU count: ${cpu_count}, Average: ${average}" >&2
    echo "$((cpu_count + average))"
}

# Update CloudFlare security level
update_security_level() {
    local level="$1"
    if ! curl -sS -X PATCH "$API_ENDPOINT" \
        -H "Authorization: Bearer ${CF_API_TOKEN}" \
        -H "Content-Type: application/json" \
        --data "{\"value\":\"$level\"}"; then
        error_exit "Failed to update security level to $level"
    fi
}

# Check and update DDoS protection status
check_ddos_status() {
    local current_load=$1
    local max_load=$2
    local normal_load
    normal_load=$(nproc)

    local current_status
    current_status=$(get_security_status)

    # Add debug output
    echo "Current load: ${current_load}"
    echo "Max load: ${max_load}"
    echo "Normal load: ${normal_load}"
    echo "Current status: ${current_status}"

    if [ "${current_load}" -gt "${max_load}" ] && [ "${current_status}" != "under_attack" ]; then
        update_security_level "under_attack"
        log "Enabled DDoS protection (Load: ${current_load})"
    elif [ "${current_load}" -lt "${normal_load}" ] && [ "${current_status}" = "under_attack" ]; then
        update_security_level "medium"
        log "Disabled DDoS protection (Load: ${current_load})"
    fi
}

main() {
    validate_config
    init_cloudflare_dir

    local cpu_load
    cpu_load=$(get_cpu_load)
    local max_allowed_load
    max_allowed_load=$(get_allowed_cpu_load)

    check_ddos_status "$cpu_load" "$max_allowed_load"
}

# Execute main function
main
