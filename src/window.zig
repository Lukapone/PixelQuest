//! Window management module for PixelQuest using GLFW
const std = @import("std");
const c = @import("c.zig");

/// Window structure that wraps GLFW window handle
pub const Window = struct {
    handle: *c.GLFWwindow,
    width: u32,
    height: u32,

    /// Initialize GLFW library
    pub fn init() !void {
        if (c.glfwInit() != c.GLFW_TRUE) {
            return error.GlfwInitFailed;
        }
    }

    /// Terminate GLFW library
    pub fn deinit() void {
        c.glfwTerminate();
    }

    /// Create a new window
    pub fn create(width: u32, height: u32, title: [:0]const u8) !Window {
        // Set window hints for OpenGL context (we'll use NO_API for now)
        c.glfwWindowHint(c.GLFW_CLIENT_API, c.GLFW_NO_API);
        c.glfwWindowHint(c.GLFW_RESIZABLE, c.GLFW_TRUE);

        const handle = c.glfwCreateWindow(
            @intCast(width),
            @intCast(height),
            title.ptr,
            null,
            null,
        ) orelse return error.WindowCreationFailed;

        // Get actual framebuffer size (may differ from requested size)
        var fb_width: c_int = undefined;
        var fb_height: c_int = undefined;
        c.glfwGetFramebufferSize(handle, &fb_width, &fb_height);

        return Window{
            .handle = handle,
            .width = @intCast(fb_width),
            .height = @intCast(fb_height),
        };
    }

    /// Destroy the window
    pub fn destroy(self: *Window) void {
        c.glfwDestroyWindow(self.handle);
        self.* = undefined;
    }

    /// Check if window should close
    pub fn shouldClose(self: *const Window) bool {
        return c.glfwWindowShouldClose(self.handle) == c.GLFW_TRUE;
    }

    /// Poll for window events
    pub fn pollEvents() void {
        c.glfwPollEvents();
    }

    /// Get current framebuffer size
    pub fn getFramebufferSize(self: *const Window) struct { width: u32, height: u32 } {
        var width: c_int = undefined;
        var height: c_int = undefined;
        c.glfwGetFramebufferSize(self.handle, &width, &height);
        return .{ .width = @intCast(width), .height = @intCast(height) };
    }
};
