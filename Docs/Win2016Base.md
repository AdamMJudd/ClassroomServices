# Windows 2016 Base Image

[Change Log](https://github.com/DDLSTraining/ClassroomServices/blob/master/Docs/Win2016BaseChangeLog.md)

## Hardware Support

#### Supported:

*   Dell 990
*   Dell 9010
*   Dell 9020
*   Dell 7040 - _Requires a new WinPE wim file in WDS to PXE boot_
*   Lenovo 8811
*   Lenovo 9088

#### Supported with issues:

*   Dell T5400 - Manual Video Driver Install

The Dell Precision T5400 Workstation driver caused the Win2016 build system to crash. If you need dual monitor support on these older machines, see the `Drivers` tab on the [Classroom Services](https://ddlstraining.github.io/ClassroomServices/) site.

*   Lenovo 7484 - Only basic Video support

The correct video driver was found and installed however it is not working once the system is booted. For reference the video driver is the `Intel(R) Q45/Q43 Express Chipset`.

#### Not Supported:

*   Dell GX270 (x86 Only)
*   Dell GX280
*   Dell GX620

## Requirements

To use the Windows 2016 base operating system you need to meet the following minimum requirements:

*   DNS Resource Record
   *   Type: `TXT`
   *   Name: `sitename`
   *   Note: Just the site name on a single line.
   *   See the [IPSiteMap](https://github.com/DDLSTraining/ClassroomServices/blob/master/IPSiteMap.json) for supported site names.
*   Run the [GhostScan script](https://github.com/DDLSTraining/ClassroomServices/blob/master/Scripts/GhostScan/README.md) to tag images as being supported.
