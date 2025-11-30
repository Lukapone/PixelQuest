// pub const c = @cImport({
//     @cDefine("GLFW_INCLUDE_NONE", {});
//     @cInclude("GLFW/glfw3.h");
// });
//this is with vulkan support enabled
//the pub extern fn below from glfw seems to be needed as they take the vk types
pub const c = @cImport({
    @cDefine("GLFW_INCLUDE_VULKAN", "1");
    @cDefine("GLFW_INCLUDE_NONE", "1");
    @cInclude("GLFW/glfw3.h");
});

const vk = @import("vulkan");

// Re-export the GLFW things that we need
pub const GLFWwindow = c.GLFWwindow;

// usually the GLFW vulkan functions are exported if Vulkan is included,
// but since thats not the case here, they are manually imported.

// Manual extern declarations are needed because @cImport creates different types
// even when importing the same C header. The c.glfwGetInstanceProcAddress
// expects c.VkInstance type, but we need to use vk.Instance from vulkan-zig.
// These are incompatible types in Zig despite representing the same C type.
pub extern fn glfwGetInstanceProcAddress(instance: vk.Instance, procname: [*:0]const u8) vk.PfnVoidFunction;
//the below function is equivalend to what compiler does but explicitly casting the types
// pub fn glfwGetInstanceProcAddress(instance: vk.Instance, procname: [*:0]const u8) vk.PfnVoidFunction {
//     return c.glfwGetInstanceProcAddress(@ptrFromInt(@intFromEnum(instance)), procname);
// }
// Same type compatibility issue as above - need manual declarations
// to bridge c.VkInstance/vk.Instance type gap
pub extern fn glfwGetPhysicalDevicePresentationSupport(instance: vk.Instance, pdev: vk.PhysicalDevice, queuefamily: u32) c_int;
pub extern fn glfwCreateWindowSurface(instance: vk.Instance, window: *GLFWwindow, allocation_callbacks: ?*const vk.AllocationCallbacks, surface: *vk.SurfaceKHR) vk.Result;
// Alternative approach: you could cast vk.Instance to c.VkInstance and use C functions:
// pub const glfwGetInstanceProcAddress = c.glfwGetInstanceProcAddress;
// Usage: const proc = glfwGetInstanceProcAddress(@ptrCast(vk_instance), "vkCreateDevice");
// pub const glfwGetPhysicalDevicePresentationSupport = c.glfwGetPhysicalDevicePresentationSupport;
// pub const glfwCreateWindowSurface = c.glfwCreateWindowSurface;
