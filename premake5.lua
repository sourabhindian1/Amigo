workspace "Amigo"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Amigo"
	location "Amigo"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"AG_PLATFORM_WINDOWS",
			"AG_BUILD_DLL"
		}

	filter "configurations:Debug"
		defines "AG_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AG_RELEASE"
		optimize "On"
		
	filter "configurations:Dist"
		defines "AG_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Amigo/vendor/spdlog/include",
		"Amigo/src"
	}

	links
	{
		"Amigo"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"AG_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "AG_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AG_RELEASE"
		optimize "On"
		
	filter "configurations:Dist"
		defines "AG_DIST"
		optimize "On"