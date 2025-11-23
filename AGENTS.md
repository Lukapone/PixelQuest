# PixelQuest - Agent Development Guidelines

## Build/Test Commands
- `zig build run` - Build and run the game
- `zig build test` - Run all tests
- `zig build test --fuzz` - Run tests with fuzzing
- `zig build` - Build without running
- `zig build-exe src/main.zig` - Direct compilation

## Code Style Guidelines
- Use 4-space indentation (Zig standard)
- Prefer `const` over `var` when possible
- Use camelCase for variables, PascalCase for types
- Error handling with `try` and `catch` - never ignore errors
- Use `!void` for functions that can fail but don't return values
- Import statements at top: `const std = @import("std");`
- Use doc comments (`//!`) for module documentation
- Use regular comments (`//`) for implementation details

## Project Structure
- `src/main.zig` - Entry point with main() function
- `src/root.zig` - Core game logic and library exports
- `build.zig` - Build configuration and dependencies
- `build.zig.zon` - Project metadata and dependencies

## Testing
- Write tests using `test "test name" { ... }` blocks
- Use `std.testing.expect()` for assertions
- Test both success and error paths
- Include fuzz tests for input validation

## Game Development Specific
- Use game loop pattern in main()
- Separate game logic from rendering
- Consider using Zig's comptime for game constants
- Memory management: prefer arena allocators for game state
