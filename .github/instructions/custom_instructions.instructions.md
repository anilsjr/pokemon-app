---
applyTo: '**.dart'
---

- Write idiomatic Dart and Flutter code with null safety (assume Flutter 3.19+).
- Use Provider or Riverpod for state management when needed.
- Prefer clean, modular, and scalable code following clean architecture or MVVM.
- Structure code with clear separation: models, view, view_model, services, and widgets.
- Use const constructors where possible.
- Keep UI widgets stateless unless state is required.
- Use Theme.of(context) and MediaQuery for responsive UI.
- Prefer Material 3 components (TextButton, ElevatedButton, etc.).
- Avoid deprecated APIs.
- Use dark mode themes and Material 3.
- Write concise, production-ready code.
- Add short comments for non-trivial logic.
- If creating an app, wrap the example in a MaterialApp with a basic theme setup.


## 1. 🏗 Architecture & Structure

## 2. 🔒 Null Safety & Type Safety
- Explicitly type all variables.
- Use `late` only when necessary.
- Mark required parameters with `required`.
- Avoid `dynamic` unless absolutely needed.
- Use null-aware operators (`?.`, `??`).
- Add null checks in controllers.

## 3. 📱 Responsive Design
- Use `MediaQuery` or context extensions for responsive layouts.
- Prefer `LayoutBuilder` for adaptive UI.

## 4. 🎨 UI Component Rules
- Create stateless widgets unless state is needed.
- Use `const` constructors where possible.
- Follow Material 3 guidelines.
- Use named parameters for clarity.
- Implement error boundaries.

## 5. 📊 Performance Optimization
- Use `const` constructors and minimal widget tree depth.
- Use `ListView.builder` for long lists.
- Use `cached_network_image` for images.
- Implement caching and lazy loading for heavy components.

## 6. 📋 Code Review Checklist
- Follow naming conventions and formatting.
- Remove unused imports/variables.
- Add comments for complex logic.
- Ensure proper separation of concerns.
- Optimize performance and error handling.
- Document public APIs and complex logic.
- Add short comments for each feature/method.



