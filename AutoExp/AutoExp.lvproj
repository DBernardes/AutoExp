<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="18008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="main.vi" Type="VI" URL="../main.vi"/>
		<Item Name="Interface.lvclass" Type="LVClass" URL="../Interface/Interface.lvclass"/>
		<Item Name="RxTx.lvclass" Type="LVClass" URL="../RxTx/RxTx.lvclass"/>
		<Item Name="State Machine.lvclass" Type="LVClass" URL="../State Machine/State Machine.lvclass"/>
		<Item Name="AutoExp.lvclass" Type="LVClass" URL="../AutoExp/AutoExp.lvclass"/>
		<Item Name="Stream.lvclass" Type="LVClass" URL="../Stream/Stream.lvclass"/>
		<Item Name="Channel.lvclass" Type="LVClass" URL="../Channel/Channel.lvclass"/>
		<Item Name="File interpreter.lvclass" Type="LVClass" URL="../File interpreter/File interpreter.lvclass"/>
		<Item Name="JSON reader.lvclass" Type="LVClass" URL="../JSON reader/JSON reader.lvclass"/>
		<Item Name="TCS.lvclass" Type="LVClass" URL="../TCS/TCS.lvclass"/>
		<Item Name="Serial Communication.lvclass" Type="LVClass" URL="../Serial Communication/Serial Communication.lvclass"/>
		<Item Name="CH1_Rx.vi" Type="VI" URL="../CH1_Rx.vi"/>
		<Item Name="CH1_Tx.vi" Type="VI" URL="../CH1_Tx.vi"/>
		<Item Name="Tests.vi" Type="VI" URL="../Tests.vi"/>
		<Item Name="CH2_Rx.vi" Type="VI" URL="../CH2_Rx.vi"/>
		<Item Name="CH2_Tx.vi" Type="VI" URL="../CH2_Tx.vi"/>
		<Item Name="CH3_Rx.vi" Type="VI" URL="../CH3_Rx.vi"/>
		<Item Name="CH3_Tx.vi" Type="VI" URL="../CH3_Tx.vi"/>
		<Item Name="CH4_Rx.vi" Type="VI" URL="../CH4_Rx.vi"/>
		<Item Name="CH4_Tx.vi" Type="VI" URL="../CH4_Tx.vi"/>
		<Item Name="TCS_Rx.vi" Type="VI" URL="../TCS_Rx.vi"/>
		<Item Name="TCS_Rx_VISA.vi" Type="VI" URL="../TCS_Rx_VISA.vi"/>
		<Item Name="TCS_Tx.vi" Type="VI" URL="../TCS_Tx.vi"/>
		<Item Name="TCS_Tx_VISA.vi" Type="VI" URL="../TCS_Tx_VISA.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="Shutter_mode typedef.ctl" Type="VI" URL="/&lt;userlib&gt;/atmcd32d.llb/Shutter_mode typedef.ctl"/>
				<Item Name="ReadMode_mode typedef.ctl" Type="VI" URL="/&lt;userlib&gt;/atmcd32d.llb/ReadMode_mode typedef.ctl"/>
				<Item Name="AcquisitionMode_mode typedef.ctl" Type="VI" URL="/&lt;userlib&gt;/atmcd32d.llb/AcquisitionMode_mode typedef.ctl"/>
			</Item>
			<Item Name="Read Initialization.vi" Type="VI" URL="../Interface/Read Initialization.vi"/>
			<Item Name="Read Temperature Status.vi" Type="VI" URL="../Interface/Read Temperature Status.vi"/>
			<Item Name="Write Temperature Status.vi" Type="VI" URL="../Interface/Write Temperature Status.vi"/>
			<Item Name="Write Initialization.vi" Type="VI" URL="../Interface/Write Initialization.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
