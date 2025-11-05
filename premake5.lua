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

	targetdir ("%{wks.location}/bin/%{outputdir}/%{prj.name}")
	objdir ("%{wks.location}/bin-int/%{outputdir}/%{prj.name}")

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
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"
