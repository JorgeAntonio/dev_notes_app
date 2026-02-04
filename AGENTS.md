# AGENTS.md

This file provides guidance to AI agents when working with code in this repository.

---

## CRITICAL: Context Loading Protocol

**BEFORE starting any work session, you MUST:**

1. **Read `docs/PROGRESS.md`** - Understand current state and next task
2. **Read `docs/PLAN.md`** - Understand the full implementation plan
3. **Read `docs/DECISIONS.md`** - Understand architectural decisions made

**AFTER completing any task:**

1. **Update `docs/PROGRESS.md`** - Mark task as completed, add date and notes
2. **Update `docs/PLAN.md`** if the task status changed
3. **Add to `docs/DECISIONS.md`** if a significant technical decision was made

This ensures continuity across sessions and prevents duplicate work or contradictory implementations.

---

## Project Overview

**DevNotes AI** is an intelligent note-taking app for developers that:

1. Connects to GitHub repositories via OAuth
2. Uses AI (OpenAI) to understand code and context
3. Helps document technical decisions with real code references

### Product Vision

- Notes linked to specific files, lines, commits, and PRs in GitHub
- AI-powered repository explanation and PR summarization
- Automatic dev journal generation based on daily commits
- Offline-first with local SQLite storage (Drift)

### Current State

See `docs/PROGRESS.md` for detailed status. The project is transforming from a UI prototype to a functional app.

---

## Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Static analysis (must pass with zero warnings)
flutter analyze

# Run code generation (Riverpod, Freezed, Drift, Retrofit)
dart run build_runner build --delete-conflicting-outputs

# Watch mode for code generation during development
dart run build_runner watch --delete-conflicting-outputs

# Run tests
flutter test

# Run single test file
flutter test test/widget_test.dart
```

---

## Architecture

### Directory Structure

```
lib/
├── main.dart                 # Entry point, wraps app in ProviderScope
└── src/
    ├── core/                 # Shared infrastructure
    │   ├── app/              # App widget (MaterialApp.router setup)
    │   ├── constants/        # API URLs, keys, app constants
    │   ├── database/         # Drift database and tables
    │   ├── network/          # Dio client and interceptors
    │   ├── routing/          # GoRouter config and route definitions
    │   ├── theme/            # AppTheme with Material 3 dark theme
    │   └── errors/           # Failure and exception classes
    ├── features/             # Feature modules (Clean Architecture)
    │   ├── auth/             # GitHub OAuth authentication
    │   ├── repositories/     # GitHub repos, commits, PRs
    │   ├── notes/            # Note CRUD with markdown editor
    │   ├── ai_assistant/     # OpenAI integration
    │   └── settings/         # User preferences
    └── shared/               # Reusable widgets and utilities
```

### Feature Module Structure

Each feature follows Clean Architecture layers:

```
features/<feature>/
├── data/
│   ├── datasources/          # Remote APIs, local DB, secure storage
│   ├── models/               # DTOs with JSON serialization
│   └── repositories/         # Repository implementations
├── domain/
│   ├── entities/             # Pure business objects (Freezed)
│   ├── repositories/         # Abstract repository interfaces
│   └── usecases/             # Business logic operations
└── presentation/
    ├── providers/            # Riverpod providers (*.dart + *.g.dart)
    ├── screens/              # Page-level widgets
    └── widgets/              # Feature-specific widgets
```

### Key Technologies

| Area | Technology | Notes |
|------|------------|-------|
| Framework | Flutter | Cross-platform |
| State Management | Riverpod + codegen | `@riverpod` annotation |
| Routing | GoRouter | Deep links, shell routes |
| HTTP Client | Dio + Retrofit | Type-safe API calls |
| Local Database | Drift | Type-safe SQLite |
| Auth | flutter_appauth | OAuth 2.0 |
| Secure Storage | flutter_secure_storage | Tokens |
| Markdown Editor | flutter_quill | Rich text |
| AI | OpenAI API | gpt-4o-mini |
| Data Classes | Freezed | Immutable entities |

---

## Code Standards

- Explicit types required; `dynamic` forbidden except for raw JSON (cast immediately)
- Use `const` constructors wherever possible
- Avoid bang operator (`!`) unless null-safety is logically proven
- Break large `build` methods into smaller private widgets
- No business logic in UI widgets—use Riverpod providers
- Check `mounted` before using `BuildContext` after async operations
- Use consistent spacing (multiples of 4/8)
- All new entities must use Freezed for immutability
- All API datasources must use Retrofit for type safety
- All database operations must use Drift

---

## Implementation Guidelines

### When implementing a new feature

1. **Check `docs/PLAN.md`** for the task list and dependencies
2. **Start with domain layer** - Create entities with Freezed
3. **Then data layer** - Implement datasources and repository
4. **Then presentation** - Providers, then screens, then widgets
5. **Run code generation** after adding annotations
6. **Update docs** when complete

### When fixing bugs

1. **Check `docs/PROGRESS.md`** for related recent changes
2. **Add the bug to PROGRESS.md** as a blocking issue if significant
3. **Document the fix** in session notes

### Code generation workflow

```bash
# After adding @riverpod, @freezed, @RestApi, or Drift tables:
dart run build_runner build --delete-conflicting-outputs

# For active development (auto-regenerates on save):
dart run build_runner watch --delete-conflicting-outputs
```

---

## Documentation Files

| File | Purpose | Update Frequency |
|------|---------|------------------|
| `docs/PLAN.md` | Technical implementation plan with all tasks | When tasks are completed |
| `docs/PROGRESS.md` | Real-time progress tracking | After every task |
| `docs/DECISIONS.md` | Architectural Decision Records (ADRs) | When decisions are made |
| `AGENTS.md` | AI agent instructions (this file) | When workflow changes |

---

## Quick Reference

### Current Phase

Check `docs/PROGRESS.md` → "Estado Actual" section

### Next Task

Check `docs/PROGRESS.md` → "Próxima Tarea" field

### Blocked?

Check `docs/PROGRESS.md` → "Bloqueos Actuales" section

---

## Session Workflow Template

```markdown
### Starting a session:
1. Read docs/PROGRESS.md
2. Read docs/PLAN.md (relevant phase)
3. Identify next task
4. Implement task
5. Run tests: flutter test
6. Run analysis: flutter analyze
7. Update docs/PROGRESS.md
8. Commit changes

### Ending a session:
1. Ensure all changes are working
2. Update docs/PROGRESS.md with session notes
3. Mark completed tasks
4. Note any blockers for next session
```
