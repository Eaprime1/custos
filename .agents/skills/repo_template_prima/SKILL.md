```markdown
# repo_template_prima Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill teaches the core development conventions and workflows used in the `repo_template_prima` TypeScript repository. It covers file organization, code style, commit practices, and testing patterns to ensure consistency and maintainability across the codebase.

## Coding Conventions

### File Naming
- **Pattern:** PascalCase
- **Example:**  
  ```plaintext
  MyComponent.ts
  UserService.ts
  ```

### Import Style
- **Pattern:** Relative imports
- **Example:**
  ```typescript
  import { UserService } from './UserService';
  ```

### Export Style
- **Pattern:** Named exports
- **Example:**
  ```typescript
  export function fetchData() { ... }
  export const API_URL = 'https://api.example.com';
  ```

### Commit Messages
- **Pattern:** Conventional commits with `docs` prefix
- **Example:**
  ```plaintext
  docs: update README with installation instructions
  docs: add API usage examples
  ```

## Workflows

### Documenting Code Changes
**Trigger:** When updating documentation or comments  
**Command:** `/docs-update`

1. Make your documentation or comment changes.
2. Stage the changes:
   ```bash
   git add .
   ```
3. Commit using the conventional format:
   ```bash
   git commit -m "docs: describe the new API endpoint"
   ```
4. Push your changes:
   ```bash
   git push
   ```

## Testing Patterns

- **Framework:** Not detected (add your preferred framework if needed)
- **Test File Pattern:** Files named with `.test.` in the filename
- **Example:**
  ```plaintext
  UserService.test.ts
  ```
- **Typical Test Structure:**
  ```typescript
  import { fetchData } from './UserService';

  describe('fetchData', () => {
    it('should return user data', () => {
      // test implementation
    });
  });
  ```

## Commands
| Command        | Purpose                                      |
|----------------|----------------------------------------------|
| /docs-update   | Document code changes with proper commit style |
```
