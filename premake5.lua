BOX2D_STATIC_LINKINK = true

project "Box2D"
	if BOX2D_STATIC_LINKINK then
		kind "StaticLib"
	else
		kind "SharedLib"
	end
	language "C++"
	cppdialect "C++11"
	staticruntime "off"

	warnings "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"src"
	}

	if not BOX2D_STATIC_LINKINK then
		defines { "B2_SHARED", "box2d_EXPORTS" }
	end

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "on"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
		symbols "off"
