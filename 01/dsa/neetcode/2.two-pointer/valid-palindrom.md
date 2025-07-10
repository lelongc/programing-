# Solving LeetCode's "Valid Palindrome": A Detailed Guide

Welcome back! Today, we're tackling a classic coding interview problem: **Valid Palindrome** (LeetCode #125). This problem is a staple in technical interviews and a part of the popular **Blind 75** list.

We'll explore two distinct methods to solve it:

1. A straightforward approach using extra memory.
2. An optimized, in-place solution using the two-pointer technique.

Understanding both is key to demonstrating versatility in an interview. Let's get started!

---

## Problem Statement

A phrase is a **palindrome** if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.

**Example:**

- **Input:** `s = "A man, a plan, a canal: Panama"`
- **Output:** `true`
- **Explanation:** After filtering, the string becomes `"amanaplanacanalpanama"`, which is a palindrome.

---

## Approach 1: Filter and Reverse (Extra Memory)

### Explanation

This approach first cleans the input string and then checks if the result is a palindrome.

1. **Build a new string:** Create a new string containing only the alphanumeric characters from the original string, converted to lowercase.
2. **Compare with reverse:** Check if this new string is identical to its reverse.

This method is straightforward but uses O(n) extra space for the new string.

### Code

```python
class Solution:
      def isPalindrome(self, s: str) -> bool:
            # Create a new string with only lowercase alphanumeric characters
            new_s = "".join(char.lower() for char in s if char.isalnum())

            # Check if the new string is equal to its reverse
            return new_s == new_s[::-1]
```

---

## Approach 2: Two Pointers (Constant Memory)

### Explanation

A more memory-efficient solution is to use two pointers, one at each end of the string, and move them toward the center. This avoids creating a new string.

1. **Initialize Pointers:** Set a `left` pointer to the start of the string (index 0) and a `right` pointer to the end (index `len(s) - 1`).
2. **Scan and Compare:**
   - Move the `left` pointer to the right until it points to an alphanumeric character.
   - Move the `right` pointer to the left until it points to an alphanumeric character.
   - Compare the characters at the `left` and `right` pointers (after converting them to lowercase). If they don't match, the string is not a palindrome, and we can return `false`.
3. **Advance Pointers:** If the characters match, move the `left` pointer one step to the right and the `right` pointer one step to the left.
4. **Termination:** Continue this process until the `left` pointer is greater than or equal to the `right` pointer. If the loop completes without returning `false`, it means the string is a palindrome.

This method has a time complexity of O(n) and a space complexity of O(1), making it a preferred solution in interviews.

### Implementing a Custom Alphanumeric Check

In an interview, you might be asked to implement the alphanumeric check yourself instead of using `isalnum()`. You can do this by checking the ASCII values of the characters.

- **Uppercase letters ('A'-'Z')**: ASCII 65-90
- **Lowercase letters ('a'-'z')**: ASCII 97-122
- **Numbers ('0'-'9')**: ASCII 48-57

### Code

```python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        left, right = 0, len(s) - 1

        while left < right:
            # Move left pointer if not alphanumeric
            while left < right and not self.is_alnum(s[left]):
                left += 1

            # Move right pointer if not alphanumeric
            while left < right and not self.is_alnum(s[right]):
                right -= 1

            # Compare characters
            if s[left].lower() != s[right].lower():
                return False

            # Move pointers inward
            left += 1
            right -= 1

        return True

    def is_alnum(self, char: str) -> bool:
        """Checks if a character is alphanumeric using ASCII values."""
        return (
            ord('A') <= ord(char) <= ord('Z') or
            ord('a') <= ord(char) <= ord('z') or
            ord('0') <= ord(char) <= ord('9')
        )
```

---

## Conclusion

We've covered two effective methods for validating a palindrome:

| Approach         | Time Complexity | Space Complexity | Notes                                            |
| ---------------- | :-------------: | :--------------: | ------------------------------------------------ |
| Filter & Reverse |      O(n)       |       O(n)       | Simple to implement, but uses extra memory.      |
| Two Pointers     |      O(n)       |       O(1)       | More efficient and often expected in interviews. |

While the first solution is quick to write, the two-pointer approach demonstrates a better understanding of space-time tradeoffs.
