const c = @cImport({
    @cDefine("GLFW_INCLUDE_NONE", {});
    @cInclude("GLFW/glfw3.h");
});

// Re-export the GLFW constants that we need
pub const GLFW_TRUE = c.GLFW_TRUE;
pub const GLFW_FALSE = c.GLFW_FALSE;
pub const GLFW_CLIENT_API = c.GLFW_CLIENT_API;
pub const GLFW_NO_API = c.GLFW_NO_API;
pub const GLFW_RESIZABLE = c.GLFW_RESIZABLE;

// Re-export the GLFW types that we need
pub const GLFWwindow = c.GLFWwindow;

// Re-export the GLFW functions that we need
pub const glfwInit = c.glfwInit;
pub const glfwTerminate = c.glfwTerminate;
pub const glfwCreateWindow = c.glfwCreateWindow;
pub const glfwDestroyWindow = c.glfwDestroyWindow;
pub const glfwWindowShouldClose = c.glfwWindowShouldClose;
pub const glfwPollEvents = c.glfwPollEvents;
pub const glfwWindowHint = c.glfwWindowHint;
pub const glfwGetFramebufferSize = c.glfwGetFramebufferSize;
