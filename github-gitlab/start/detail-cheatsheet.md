# Git Cheatsheet - Hướng dẫn đầy đủ 📚

## 🚀 Cài đặt & Cấu hình ban đầu

```bash
# Cài đặt thông tin cá nhân
git config --global user.name "Tên của bạn"
git config --global user.email "email@example.com"

# Xem cấu hình
git config --list
git config user.name

# Cấu hình editor mặc định
git config --global core.editor "code --wait"  # VSCode
git config --global core.editor "vim"          # Vim

# Cấu hình line ending
git config --global core.autocrlf true   # Windows
git config --global core.autocrlf input  # Mac/Linux
```

## 📁 Khởi tạo Repository

```bash
# Khởi tạo repo mới
git init
git init <tên-thư-mục>

# Clone repo từ remote
git clone <url>
git clone <url> <tên-thư-mục>
git clone --depth 1 <url>  # Shallow clone (chỉ commit gần nhất)
```

## 📊 Kiểm tra trạng thái

```bash
# Xem trạng thái file
git status
git status -s           # Compact format
git status --porcelain  # Machine-readable format

# Xem thay đổi
git diff                    # Thay đổi chưa staged
git diff --staged           # Thay đổi đã staged
git diff --cached           # Tương tự --staged
git diff HEAD               # So với commit cuối
git diff <commit1> <commit2>
git diff <branch1> <branch2>

# Xem file cụ thể
git diff <file>
git diff --staged <file>
```

## ➕ Staging Area

```bash
# Thêm file vào staging
git add <file>
git add .                    # Tất cả file
git add *.js                 # Tất cả file .js
git add --all                # Tất cả file kể cả deleted
git add -A                   # Tương tự --all
git add -u                   # Chỉ file đã tracked

# Thêm từng phần của file
git add -p <file>
git add --patch <file>

# Loại bỏ khỏi staging
git reset <file>
git reset HEAD <file>
git restore --staged <file>  # Git 2.23+
```

## 💾 Commit

```bash
# Commit cơ bản
git commit -m "Message"
git commit -am "Message"     # Add và commit file đã tracked

# Commit với editor
git commit

# Sửa commit cuối
git commit --amend
git commit --amend -m "New message"
git commit --amend --no-edit

# Commit rỗng
git commit --allow-empty -m "Empty commit"

# Commit với date cụ thể
git commit --date="2023-01-01 12:00:00" -m "Message"
```

## 📜 Xem lịch sử

```bash
# Log cơ bản
git log
git log --oneline
git log --graph
git log --graph --oneline --all

# Log với format
git log --pretty=format:"%h - %an, %ar : %s"
git log --pretty=oneline
git log --pretty=short

# Log với thống kê
git log --stat
git log --shortstat
git log --name-only
git log --name-status

# Log theo thời gian
git log --since="2 weeks ago"
git log --until="2023-01-01"
git log --since="2023-01-01" --until="2023-12-31"

# Log theo tác giả
git log --author="John"
git log --committer="John"

# Log theo message
git log --grep="bug"
git log --grep="feat" --grep="fix" --all-match

# Log file cụ thể
git log <file>
git log -p <file>            # Với diff
git log --follow <file>      # Theo dõi rename

# Log với số lượng giới hạn
git log -n 5                 # 5 commit gần nhất
git log -5                   # Tương tự
git log --max-count=5

# Xem commit cụ thể
git show <commit>
git show <commit>:<file>     # File tại commit đó
git show --name-only <commit>
```

## 🌿 Quản lý Branch

```bash
# Xem branch
git branch                   # Local branches
git branch -r                # Remote branches
git branch -a                # Tất cả branches
git branch -v                # Với commit cuối
git branch -vv               # Với tracking info

# Tạo branch
git branch <tên-branch>
git branch <tên-branch> <commit>

# Chuyển branch
git checkout <branch>
git switch <branch>          # Git 2.23+

# Tạo và chuyển branch
git checkout -b <branch>
git switch -c <branch>       # Git 2.23+
git checkout -b <branch> <start-point>

# Đổi tên branch
git branch -m <tên-mới>      # Branch hiện tại
git branch -m <tên-cũ> <tên-mới>

# Xóa branch
git branch -d <branch>       # Safe delete
git branch -D <branch>       # Force delete
git branch --delete <branch>

# Xóa remote branch
git push origin --delete <branch>
git push origin :<branch>
```

## 🔄 Merge & Rebase

```bash
# Merge
git merge <branch>
git merge --no-ff <branch>   # Tạo merge commit
git merge --squash <branch>  # Squash thành 1 commit
git merge --abort            # Hủy merge khi conflict

# Rebase
git rebase <branch>
git rebase -i <commit>       # Interactive rebase
git rebase --continue        # Tiếp tục sau khi fix conflict
git rebase --abort           # Hủy rebase
git rebase --skip            # Skip commit hiện tại

# Rebase với options
git rebase --onto <newbase> <upstream> <branch>
git rebase -X theirs <branch>    # Ưu tiên their changes
git rebase -X ours <branch>      # Ưu tiên our changes
```

## 🌐 Remote Repository

```bash
# Xem remote
git remote
git remote -v
git remote show origin

# Thêm remote
git remote add <name> <url>
git remote add origin <url>

# Thay đổi URL remote
git remote set-url origin <new-url>

# Xóa remote
git remote remove <name>
git remote rm <name>

# Fetch & Pull
git fetch                    # Lấy về không merge
git fetch origin
git fetch --all             # Từ tất cả remote

git pull                    # Fetch + merge
git pull origin main
git pull --rebase           # Fetch + rebase thay vì merge
git pull --ff-only          # Chỉ fast-forward merge

# Push
git push
git push origin main
git push -u origin main     # Set upstream
git push --force            # Force push (NGUY HIỂM!)
git push --force-with-lease # Safer force push
git push --all              # Push tất cả branches
git push --tags             # Push tất cả tags
```

## 🔖 Tags

```bash
# Xem tags
git tag
git tag -l "v1.*"           # Filter tags

# Tạo tag
git tag <tên-tag>           # Lightweight tag
git tag -a <tên-tag> -m "Message"  # Annotated tag
git tag <tên-tag> <commit>  # Tag commit cụ thể

# Xem thông tin tag
git show <tag>

# Push tags
git push origin <tag>
git push origin --tags
git push --follow-tags

# Xóa tag
git tag -d <tag>            # Local
git push origin --delete <tag>  # Remote
git push origin :refs/tags/<tag>
```

## 🗂️ Stash

```bash
# Stash cơ bản
git stash
git stash push -m "Message"
git stash save "Message"    # Deprecated

# Stash với options
git stash -u                # Include untracked files
git stash -a                # Include all files
git stash --keep-index      # Keep staged changes
git stash -p                # Patch mode

# Xem stash
git stash list
git stash show              # Stash gần nhất
git stash show stash@{0}
git stash show -p           # Với diff

# Apply stash
git stash pop               # Apply và xóa
git stash apply             # Apply không xóa
git stash apply stash@{1}   # Apply stash cụ thể

# Xóa stash
git stash drop              # Xóa stash gần nhất
git stash drop stash@{1}    # Xóa stash cụ thể
git stash clear             # Xóa tất cả stash

# Tạo branch từ stash
git stash branch <branch-name>
```

## ⏪ Reset & Revert

```bash
# Reset
git reset <commit>          # --mixed (default)
git reset --soft <commit>   # Giữ staged changes
git reset --hard <commit>   # Xóa tất cả changes
git reset --merge <commit>  # Reset merge
git reset --keep <commit>   # Keep local changes

# Reset file
git reset <file>
git reset HEAD <file>
git checkout -- <file>     # Restore từ HEAD
git restore <file>          # Git 2.23+

# Revert
git revert <commit>
git revert <commit1>..<commit2>
git revert --no-commit <commit>  # Không tự động commit
git revert -m 1 <merge-commit>   # Revert merge commit
```

## 🔍 Tìm kiếm & Debug

```bash
# Grep trong code
git grep "pattern"
git grep -n "pattern"       # Với số dòng
git grep -c "pattern"       # Đếm matches
git grep "pattern" -- "*.js"

# Blame - xem ai thay đổi
git blame <file>
git blame -L 10,20 <file>   # Từ dòng 10-20
git blame -C <file>         # Detect copy/move

# Bisect - tìm commit gây lỗi
git bisect start
git bisect bad              # Commit hiện tại có bug
git bisect good <commit>    # Commit tốt
# ... test và đánh dấu good/bad
git bisect reset

# Log tìm kiếm
git log -S "function_name"  # Tìm thay đổi của string
git log -G "regex"          # Tìm theo regex
git log --follow <file>     # Theo dõi file qua rename
```

## 🛠️ Công cụ hữu ích

```bash
# Cherry-pick
git cherry-pick <commit>
git cherry-pick <commit1>..<commit2>
git cherry-pick --no-commit <commit>

# Reflog - lịch sử HEAD
git reflog
git reflog show <branch>
git reflog expire --expire=90.days.ago --all

# Clean - xóa file untracked
git clean -n                # Dry run
git clean -f                # Xóa file
git clean -fd               # Xóa file và thư mục
git clean -fx               # Bao gồm file ignored

# Archive
git archive --format=zip HEAD > project.zip
git archive --format=tar.gz HEAD > project.tar.gz

# Worktree - nhiều working directory
git worktree add <path> <branch>
git worktree list
git worktree remove <path>
```

## ⚙️ Cấu hình nâng cao

```bash
# Alias hữu ích
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'

# Merge tool
git config --global merge.tool vimdiff
git config --global mergetool.keepBackup false

# Diff tool
git config --global diff.tool vimdiff

# Push settings
git config --global push.default simple
git config --global push.followTags true

# Pull settings
git config --global pull.rebase true
```

## 📝 .gitignore Patterns

```bash
# File cụ thể
secret.txt

# Extension
*.log
*.tmp

# Thư mục
node_modules/
.env/

# Glob patterns
**/logs
**/logs/**
*.log

# Ngoại lệ
!important.log

# Platform specific
.DS_Store      # macOS
Thumbs.db      # Windows
*.swp          # Vim
```

## 🔧 Sửa lỗi thường gặp

```bash
# Uncommit file nhưng giữ lại changes
git reset --soft HEAD~1

# Xóa file khỏi Git nhưng giữ local
git rm --cached <file>

# Thay đổi message commit cuối
git commit --amend -m "New message"

# Undo push cuối (nguy hiểm!)
git reset --hard HEAD~1
git push --force-with-lease

# Recovery commit đã xóa
git reflog
git cherry-pick <commit-hash>

# Fix detached HEAD
git checkout main
git branch temp-branch <commit>

# Remove sensitive data
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch <file>' --prune-empty --tag-name-filter cat -- --all
```

## 📋 Git Hooks

```bash
# Hooks directory
.git/hooks/

# Quan trọng nhất:
pre-commit      # Chạy trước commit
pre-push        # Chạy trước push
post-merge      # Chạy sau merge
commit-msg      # Validate commit message

# Ví dụ pre-commit hook:
#!/bin/sh
npm test
```

## 🎯 Best Practices

1. **Commit thường xuyên**: Tạo commit nhỏ, tập trung
2. **Message rõ ràng**: Sử dụng Conventional Commits
3. **Branch strategy**: Git Flow hoặc GitHub Flow
4. **Code review**: Sử dụng Pull/Merge Request
5. **Backup**: Push thường xuyên lên remote
6. **Security**: Không commit secrets, sử dụng .gitignore

---

**💡 Tip cuối**: Luôn chạy `git status` trước khi thực hiện các lệnh quan trọng!
