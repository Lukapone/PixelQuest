// pub const c = @cImport({
//     // @cDefine("GLFW_INCLUDE_VULKAN", "1");
//     @cDefine("GLFW_INCLUDE_NONE", "1");
//     @cInclude("GLFW/glfw3.h");
// });
//reexport from vulkan
pub const c = @import("../../../vulkan/c.zig").c;
