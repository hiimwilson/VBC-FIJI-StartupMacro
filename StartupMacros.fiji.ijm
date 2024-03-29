// "StartupMacros"
// The macros and macro tools in this file ("StartupMacros.txt") are
// automatically installed in the Plugins>Macros submenu and
//  in the tool bar when ImageJ starts up.

//  Edited by Wilson Adams, Vanderbilt Biophotonics Center, 2018
//


// Global variables
var pencilWidth=1,  eraserWidth=10, leftClick=16, alt=8;
var brushWidth = 10; //call("ij.Prefs.get", "startup.brush", "10");
var floodType =  "8-connected"; //call("ij.Prefs.get", "startup.flood", "8-connected");

// The macro named "AutoRunAndHide" runs when ImageJ starts
// and the file containing it is not displayed when ImageJ opens it.

// macro "AutoRunAndHide" {}

function UseHEFT {
	requires("1.38f");
	state = call("ij.io.Opener.getOpenUsingPlugins");
	if (state=="false") {
		setOption("OpenUsingPlugins", true);
		showStatus("TRUE (images opened by HandleExtraFileTypes)");
	} else {
		setOption("OpenUsingPlugins", false);
		showStatus("FALSE (images opened by ImageJ)");
	}
}

UseHEFT();

// The macro named "AutoRun" runs when ImageJ starts.

macro "AutoRun" {
	// run all the .ijm scripts provided in macros/AutoRun/
	autoRunDirectory = getDirectory("imagej") + "/macros/AutoRun/";
	if (File.isDirectory(autoRunDirectory)) {
		list = getFileList(autoRunDirectory);
		// make sure startup order is consistent
		Array.sort(list);
		for (i = 0; i < list.length; i++) {
			if (endsWith(list[i], ".ijm")) {
				runMacro(autoRunDirectory + list[i]);
			}
		}
	}
}

var pmCmds = newMenu("Popup Menu",
	newArray("Help...", "Rename...", "Duplicate...", "Original Scale",
	"Paste Control...", "-", "Record...", "Capture Screen ", "Monitor Memory...",
	"Find Commands...", "Control Panel...", "Startup Macros...", "Search..."));

macro "Popup Menu" {
	cmd = getArgument();
	if (cmd=="Help...")
		showMessage("About Popup Menu",
			"To customize this menu, edit the line that starts with\n\"var pmCmds\" in ImageJ/macros/StartupMacros.txt.");
	else
		run(cmd);
}

macro "Abort Macro or Plugin (or press Esc key) Action Tool - CbooP51b1f5fbbf5f1b15510T5c10X" {
	setKeyDown("Esc");
}

var xx = requires138b(); // check version at install
function requires138b() {requires("1.38b"); return 0; }

var dCmds = newMenu("Developer Menu Tool",
newArray("ImageJ Website","News", "Documentation", "ImageJ Wiki", "Resources", "Macro Language", "Macros",
	"Macro Functions", "Startup Macros...", "Plugins", "Source Code", "Mailing List Archives", "-", "Record...",
	"Capture Screen ", "Monitor Memory...", "List Commands...", "Control Panel...", "Search...", "Debug Mode", "Update"));

macro "Developer Menu Tool - C037T0b11DT7b09eTcb09v" {
	cmd = getArgument();
	if (cmd=="ImageJ Website")
		run("URL...", "url=http://rsbweb.nih.gov/ij/");
	else if (cmd=="News")
		run("URL...", "url=http://rsbweb.nih.gov/ij/notes.html");
	else if (cmd=="Documentation")
		run("URL...", "url=http://rsbweb.nih.gov/ij/docs/");
	else if (cmd=="ImageJ Wiki")
		run("URL...", "url=http://imagejdocu.tudor.lu/imagej-documentation-wiki/");
	else if (cmd=="Resources")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/");
	else if (cmd=="Macro Language")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/macro/macros.html");
	else if (cmd=="Macros")
		run("URL...", "url=http://rsbweb.nih.gov/ij/macros/");
	else if (cmd=="Macro Functions")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/macro/functions.html");
	else if (cmd=="Plugins")
		run("URL...", "url=http://rsbweb.nih.gov/ij/plugins/");
	else if (cmd=="Source Code")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/source/");
	else if (cmd=="Mailing List Archives")
		run("URL...", "url=https://list.nih.gov/archives/imagej.html");
	else if (cmd=="Debug Mode")
		setOption("DebugMode", true);
	else if (cmd=="Update") 
		run("Update...");
	else if (cmd!="-")
		run(cmd);
}

var sCmds = newMenu("Stacks Menu Tool",
	newArray("Add Slice", "Delete Slice", "Next Slice [>]", "Previous Slice [<]", "Set Slice...", "-",
		"Convert Images to Stack", "Convert Stack to Images", "Make Montage...", "Reslice [/]...", "Z Project...",
		"3D Project...", "Temporal-Color Code", "Plot Z-axis Profile", "-", "Start Animation", "Stop Animation", "Animation Options...",
		"-", "MRI Stack (528K)"));

//Import Sequence tool
macro "Import Image Sequence Action Tool - C6abD44D62C577D05D23D24D41D42De1CfffD18D19D98D99Db6Db7Dd4Dd5C033D1eD2eD3eD4eD5eD6eD7eD8eD9eDbcDdaC8bbDa5Dc3C795D6cCfffD15D16D17D25D33D35D43D45D51D53D55D61D63D65D71D73D75D81D83D85D91D93D95D96D97Da1Da3Db1Db3Db4Db5Dc1Dd1Dd2Dd3Df0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfbDfcDfdDfeDffC000DbeDdcC5aeD26D36C798Da9Dc7C255D0cDe8CeffD1bD9bDb9Dd7C9a7D2cC6abD84Da2C588D01D02D03D04D11D12D13D14D20D21D22D30D31D32D40D50D60D70D80D90Da0Db0Dc0Dd0De0C144DadDcbCcedD68C7a9Da7Dc5C122D00C6bdD39C366D09De5CeffD1aD1dD9aD9dDb8DbbDd6Dd9Cbb9D2bC6abD54D64D72D74D82D92CaddD87C798Da8Dc6C022D0eDaeDccDeaC6beD57D66D76C366D0aD10De6Cac8D7aC5adD27C244D0dDacDcaDe9CeffD1cD2dD3dD4dD5dD6dD7dD8dD9cDbaDd8C8aaDa6Dc4C7cfD37C477D07De3CbcaD7bCcdbD6bC8a6D5cC6adD29C355D0bDe7Cab7D3cC7abD94Db2C8a9D8aC8cdD58C477D08De4Cbd8D4bC9dfD3aC799DaaDc8C9aaDabDc9C7bcDa4Dc2C8aaD8cC7cfD38C477D06De2CcdaD59CacbD88C9b7D4cC6beD49D86Cbc9D5aCcecD78Cbc8D79C5adD28C7cfD47CbdaD6aCbccD34D52C898D7cC5aeD46D56Cab8D5bC8a9D8bCcc9D69C9efD77C6bdD2aC8baD89C7dfD48CddaD3bCbeeD4aC8dfD67" {
	run("Image Sequence...");
}

// Bioformats Importer Action Tool 
macro "Bioformats Importer Action Tool - CfabD45Cd23D43D53D54D62D63D64D72D73D74D75D82D83D84D85D93D94Da3CfffD00D01D02D03D04D05D06D07D08D09D0aD0bD0cD0dD0eD0fD10D11D12D14D15D16D18D19D1aD1cD1dD1eD1fD20D21D22D25D29D2dD2eD2fD30D31D3eD3fD40D4eD4fD50D5fD6fD9fDa0DafDb0Db1DbeDbfDc0Dc1Dc5Dc9DcdDceDcfDd0Dd1Dd2Dd5Dd6Dd9DdaDddDdeDdfDe0De1De2De3De4De5De6De7De8De9DeaDebDecDedDeeDefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfbDfcDfdDfeDffC498D78D7aCfeeD35D60Ce67D86C18cD5cD7dD8dDacCfccD32Cd24D92Da4Db3C8bbDc8CfffD13CcedDb9C287D37D48CfbcD80C4adD7cCfffD39CeaaD66C29dD9dCfddDc2Dd4Ce34D33C9ceD2bCfffD17D1bD26D2aDaeCdeeDc6C186Db7CfbbD51D70Dd3C5a9D38Ce78Da5C29cD4cD6cD6dCfcdDa1Db5Ce34D44D52D71D81D95C9cbDb6CbdfD3aD9eC297D88Da7C6bdD3cCfffD41D90CbddD36C39dD8cDcbCe45Dc3CbddD9aCdefDdcC4a9D59Ce67D42C28cD4bD9cDbbCfccD24Ce34D65C8cbD6aCbdeDaaC297D99C5adD5dCcddDa6C39dDabDbcCe45Da2Db4C9ceD6bCdefDbdC186D47D68D69C4adD5bCe89Db2CbdcD49Dd7CcefD2cC398D57Dc7C7beD9bDccCdddD87Ce56D55CadeD4dDdbCeffD3dD5eD7fD8fCe67D34C8cbD27CbdeD5aC4adD7eCebbD96C39dD3bC9ceD4aCeeeDd8C6b9Da9Ce89Dc4C9ccD46C7beDadCcddD28Ce56D76CadeD6eC5a9D8aCe77D91C9cbD67CceeD7bD8bC297Db8C5adD8eCdddD56C9ceDbaCdefDcaC7baD97Ce9aD23CeddD77Ce57D61" {
	run("Bio-Formats Importer");
	// Rename images after importing to file parent name - PMT1, SRS, PMT3
	Dialog.create("MANTIS Image Stack Rename")
	Dialog.addMessage("Do you want to rename your images? (MANTIS only)")
	Dialog.addChoice(" ", newArray("yes", "no"), "yes")
	Dialog.show()
	choice = Dialog.getChoice()
	if (choice == "yes") {
	runMacro("MANTIS_imgrename.ijm")
	}
}

macro "Stacks Menu Tool - C037T0b11ST8b09tTcb09k" {
	cmd = getArgument();
	if (cmd!="-") run(cmd);
}

var luts = getLutMenu();
var lCmds = newMenu("LUT Menu Tool", luts);
macro "LUT Menu Tool - C037T0b11LT6b09UTcb09T" {
	cmd = getArgument();
	if (cmd!="-") run(cmd);
}
function getLutMenu() {
	list = getLutList();
	menu = newArray(16+list.length);
	menu[0] = "Invert LUT"; menu[1] = "Apply LUT"; menu[2] = "-";
	menu[3] = "Fire"; menu[4] = "Grays"; menu[5] = "Ice";
	menu[6] = "Spectrum"; menu[7] = "3-3-2 RGB"; menu[8] = "Red";
	menu[9] = "Green"; menu[10] = "Blue"; menu[11] = "Cyan";
	menu[12] = "Magenta"; menu[13] = "Yellow"; menu[14] = "Red/Green";
	menu[15] = "-";
	for (i=0; i<list.length; i++)
		menu[i+16] = list[i];
	return menu;
}

function getLutList() {
	lutdir = getDirectory("luts");
	list = newArray("No LUTs in /ImageJ/luts");
	if (!File.exists(lutdir))
		return list;
	rawlist = getFileList(lutdir);
	if (rawlist.length==0)
		return list;
	count = 0;
	for (i=0; i< rawlist.length; i++)
		if (endsWith(rawlist[i], ".lut")) count++;
	if (count==0)
		return list;
	list = newArray(count);
	index = 0;
	for (i=0; i< rawlist.length; i++) {
		if (endsWith(rawlist[i], ".lut"))
			list[index++] = substring(rawlist[i], 0, lengthOf(rawlist[i])-4);
	}
	return list;
}


// B&C tool
macro "Adjust Brightness and Contrast Action Tool - C333DabDbaCaaaD5cDcaDd7Dd8C888D3dD4dD4eD5eD6cD6eDc9De4De5De6De7De8De9CdddD4bDb4C555D88D97Da6Db6CdddD24D2bD42Db2C999D5dDadDdaCfffD25D37D38D45D46D47D48D49D52D55D56D57D58D64D65D66D67D68D74D75D76D77D84D85D86D94D95Da2Da4C555D5bD6aD79D7aD89D8cD98Da7Da8Db7CcccD14D15D16D17D18D19D1aD1bD23D32D41D51D61D71D81D91Da1Db1Dc2C888Dc6DccDd3Dd4CeeeD2aD4aD59C777D7eD8eD9cD9eDaeDbdDbeDcdDdbDdcDeaDebCaaaD4cD6dD7dD8dDacDbbDc4Dd6Dd9C444D6bD7bD7cD8aD99Da9Db8Dc7Dc8CcccD2cDc3CeeeD33C666Db5C999D9dDbcDcbDd5C444D8bD9aD9bDaaDb9CbbbD3cD5aD69D78D87D96Da5CbbbDc5" {
    run("Brightness/Contrast...");
}

// Plot Z projection
macro "Plot Z Axis Profile Action Tool - C000D0dD0eD13D14D15D16D17D18D19D1aD1bD1cD1dD20D21D22D23D24D25D26D27D28D29D2aD2bD2cD2fD33D34D35D36D37D38D39D3aD3bD3eD3fD47D48D49D4aD4dD4eD4fD5cD5dD5eD5fD6bD6cD6dD6eD6fD7dD7eD7fD8dD8eD8fD9dD9eD9fDaeDafDbeDbfDcfDdfDefDffC000C111C222C333C444D1fD2eD3dD4cD5bD6aD79D87D88D96Da5Db4Dc3Dd2De1Df0C444C555C666C777C888C999CaaaCbbbCcccD0fD1eD2dD3cD4bD5aD69D78D86D95Da4Db3Dc2Dd1De0CcccCdddCeeeCfff"{
	run("Plot Z-axis Profile")
}


// Z project
macro "Maximum Intensity Projection Action Tool (+shift = Avg; +space = StDev; +alt = ZProj Menu) - C902T3f18Z" {
	n = nSlices;
    if (isKeyDown("shift"))
    run("Z Project...", "projection=[Average Intensity]");
    if (isKeyDown("space"))
    run("Z Project...", "projection=[Standard Deviation]");
    if (isKeyDown("alt"))
    run("Z Project...");
    else
    run("Z Project...", "projection=[Max Intensity]");
}

// Temporal Color Code MIP
//macro "Temporal Color Code MIP Action Tool - Cf77D83C37dDcbDdaCfcfD97C4d3D2aCf7cDa4Cb4dDe6CfffD00D01D02D03D04D05D06D07D08D09D0aD0bD0cD0dD0eD0fD10D11D12D13D1cD1dD1eD1fD20D21D22D2dD30D31D40D50D60D70D80D90Da0Db0Dc0Dc1Dd0Dd1Dd2De0De1De2De3DefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfeDffC7c2D17Cfc7D54C5beD8bCfefDe4Cad4D16CfccD72CbdeDfbC16bDbdCe79D91C56eDd9C7f7D4aCf9cDa3CaafDa9C62cDe8CebaD51C6dfDacCeffD88CacaD3dCffcD67CdddD3eC298D7eCfa7D63C2adD8dC7f6D3aCe7fDc6Ca7fDc8C7a8D5eCff7D45C6fcD6cCbf8D48CfbeD96CadfD9aC27bD9dCf89D84C59dDebC8d8D1aCfbeDc2CacdDeeC78aDaeCfdaD43C8fcD6bCde9D15CefeD78CeeeD4fD5fD6fD7fD8fD9fDafDbfC2a4D4dCf87D73C38dDbbC2c7D5dCf8eDa5Cd5dDd4Ce76D71Cfd9D65C5dfDbcDccDdcCdd5D24CfebD66CafeD7aC37bDceCe7aDa2C95fDd8C3ebD6dCfadD95Cd9eDe5C82cDe7CfcaD62CabdDdfCafaD59CefeD1bC289D8eCea8D52C49cDfcC8f6D39Cf7fDb5Cc7fDc7Cea6D42Cff9D35D56C4feD7dCef7D36CfefD87Db1CcfeD79C37bDdeCfabD85D92C78dDeaC7faD5bCeafDa7CbcfD99CbcbD4eCfebD32C9fcD6aCdf9D27CffeD77C2b3D3cC5f6D3bCf8dDb4Cd6fDd6C5c4D19Cfe8D44D55C3cfDddCcf6D37CfcdD86CbfcD69C16bDadCf7aD93C78fDbaC6f8D4bCf9dDb3CcafDa8C54cDe9CfbaD75C7dfDecCaeaD2cC3a7D6eCf98D74C49dD9bC8f6D29Cf8fDb6Cb6fDd7Ce66D81Cef8D46Cbf8D28CeeeD2eD3fCaffD8aC39cD8cCfabDa1C58fDc9C9f8D49CfbeDd3CaceDfdC69bDcfCfeaD34Cdf8D47CfffD2fC5c2D18Ce97D61C38dDabC4e7D4cCf8eDc4Cd5eDd5Cec5D33Cde6D25CfdcD76CdfcD68C37bDcdCf8bD94C98fDb9C5faD5cCfbcD82Cd8fDb7Ce5bDc3CfdaD53C9efD9cDdbCcfaD58CffeD14C38aD9eCfb8D64C48eDcaCaf6D38Cf8fDc5Cb8fDb8Ce6aDb2C6feD7cCdf8D26CcffD89C48cDedC8afDaaC8faD5aCfafDa6CdcfD98CbbcDbeCfebD23C8feD7bCefaD57CffeD41" {
//	run("Temporal-Color Code");
//}

// ROI Manager
macro "ROI Manager Action Tool - C902D00D01D02D10D11D12D20D21D22D30D31D32D40D41D42D50D51D52D60D61D62D70D71D72D80D81D82D90D91D92Da0Da1Da2Db0Db1Db2Dc0Dc1Dc2CfffD03D04D05D06D07D08D09D0aD0bD0cD0dD0eD0fD13D14D15D16D17D18D19D1aD1bD1cD1dD1eD1fD23D24D25D26D27D28D29D2aD2bD2cD2dD2eD2fD33D34D35D36D37D38D39D3aD3bD3cD3dD3eD3fD43D44D45D46D47D48D49D4aD4bD4cD4dD4eD4fD53D54D55D56D57D58D59D5aD5bD5cD5dD5eD5fD63D64D65D66D67D68D69D6aD6bD6cD6dD6eD6fD73D74D75D76D77D78D79D7aD7bD7cD7dD7eD7fD83D84D85D86D87D88D89D8aD8bD8cD8dD8eD8fD93D96D99D9cD9fDa3Da6Da9DacDafDb3Db6Db9DbcDbfDc3Dc6Dc9DccDcfDd3Dd6Dd9DdcDdfDe3De6De9DecDefDf3Df6Df9DfcDffCbbbD94D95D97D98D9aD9bD9dD9eDa4Da5Da7Da8DaaDabDadDaeDb4Db5Db7Db8DbaDbbDbdDbeDc4Dc5Dc7Dc8DcaDcbDcdDceDd4Dd5Dd7Dd8DdaDdbDddDdeDe4De5De7De8DeaDebDedDeeDf4Df5Df7Df8DfaDfbDfdDfeCf00Dd0Dd1Dd2De0De1De2Df0Df1Df2"{
run("ROI Manager...");
}

// RGB Merge
macro "RGB Merge (+shift=Split; +alt=Convert to RGB) Action Tool - Cff0D63D64D65D71D72D73D74D75D81D82D83D84D85D93D94D95C0f0D90D91D92Da0Da1Da2Da3Da4Da5Da6Db0Db1Db2Db3Db4Db5Db6Dc0Dc1Dc2Dc3Dc4Dc5Dc6Dc7Dc8Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8De1De2De3De4De5De6De7De8Df3Df4Df5Df6Cf0fD39D47D48D49D57D58D59D67D68D69Cf00D03D04D05D06D11D12D13D14D15D16D17D18D21D22D23D24D25D26D27D28D30D31D32D33D34D35D36D37D38D40D41D42D43D44D45D46D50D51D52D53D54D55D56D60D61D62C00fD3aD3bD3cD4aD4bD4cD4dD4eD5aD5bD5cD5dD5eD6aD6bD6cD6dD6eD6fD79D7aD7bD7cD7dD7eD7fD89D8aD8bD8cD8dD8eD8fD9aD9bD9cD9dD9eD9fDaaDabDacDadDaeDbaDbbDbcDbdDbeDcaDcbDccCfffD66D76D77D78D86D87D88D96C0ffD97D98D99Da7Da8Da9Db7Db8Db9Dc9"
{
if (nSlices==3)
	{
	run("Convert Stack to RGB");
	}
else
	{if(isKeyDown("shift"))
	{	run("RGB Split");}
	else {run("RGB Color");}
	}

}

// Set Scale
macro "Set Scale Action Tool - CecbD69D7aCda7D97CfffD00D01D02D03D04D05D06D07D08D09D0aD0bD0cD0dD0eD0fD1fD2fD3fD40D4fD50D51D59D5aD5fD60D61D62D6aD6fD70D71D72D73D7fD80D81D82D83D84D8fD90D91D92D93D94D95D9fDa0Da1Da2Da3Da4Da5Da6DafDb0Db1Db2Db3Db4Db5Db6Db7DbfDc0Dc1Dc2Dc3Dc4Dc5Dc6Dc7Dc8DcfDd0Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8Dd9DdfDe0De1De2De3De4De5De6De7De8De9DeaDefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfbDffCb96D1eDfeCfffD30D41D52D63D74D85Ceb8D22Cc85D1bD4bD5bD6bD7bD8bCffeD96Da7Db8Dc9DdaDebDfcCeb8D21D39D3aD4dD67D6dD8dDadDbbDcdCd96D46D57DddCec8D36D77C964D3eD5eD7eD9eDbeDdeCedbD58Ceb7D32D3bD43D54D78D89DccCd96DcbCeb8D20D31D42Cc85D9bCeb8D4cD5cD6cD7cD8cD9cDacCda7D13D98Cfc9D55Ca74D1dCea7D3cD65DbcCc96D17D3dD47D5dD68D7dD9dDbdDdcCeb8D2bD2dD38D45D56DaaCb85D18Cda7D2aDb9Ceb9D10Ca75D1cCc97DdbCeb8D29D37D88D99Cc96D12D14Cda7Da8Cfd9D23Cdb7D24Cc96D48D79Cda6D15D2cDa9DbaCfc9D27D34D35D66Cc95D19D49D8aCda7D11D28D76D87DabCfc9D25D33D44Cda8D75Cb86D16DfdCb85D1aCca7DcaCda7D26D86D9aCc95D4aDedCc96DecCdb8D53D64" {
	run("Set Scale...")
}

// Scale Bar tool
macro "Scale Bar Action Tool - C902F02f3 -C902T1e0cu -C902T6e0cm" {
	run("Scale Bar...")
	}

// Series Labeller
macro "Series Labeller Action Tool - CddfD83D95D97D99D9bDa5Da7Da9DabDb7Db9DbbDbdDc7Dc9DcbDcdC899D2eDdeCfffD00D01D0aD0bD0cD0dD0eD0fD10D11D1aD1bD1cD1dD1eD1fD31D3aD3cD3eD4aD4cD4eD6aD6cD6eD7aD7cD7eD8aD8cD8eD9cD9eDacDaeDb2DbeDc0DccDceDd0Dd1De0De1De2De3De4De5De6De7De8De9DeaDebDecDedDeeDefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfbDfcDfdDfeDffCdb4D52CeffD82Da4CccbD73C788D3fD4fD5fD6fD7fD8fD9fDafDbfDcfCdefD3bD3dD4bD4dD6bD6dD7bD7dD8bD8dD9dDadCabbDd9Cfe8D33CfffD96Db8CcddD20Cbb4D87C9aaD2cD2fDdcDdfCfe7D24D34D35D43D45D46D56D57D67D76CeffD71Dc6Cff9D16D17D28D38Cdc4D05D53D74CbccD21D30D40D50D60D70D80D90Da0Db1Dc2Cfe8D77CfffD41D61D98D9aDa8DaaDbaDbcDc8DcaCfccD5aD5bD5cD5dD5eCa93D39C9aaD2dDa3Db3Dc3Dd3DddCed7D02CeffD72D81D91D94Da6Db6Dc4Cfe9D13D15D48CaccDd6Cfe8D25D26D27D36D37D47CeeeD92Db0Db4Dc1Dd2Ccb4D54CabbD2aD2bDa2DdaDdbCffaD18Cba6D89Cfe9D14D58D68D78Cb92D59Cdc5D03D12D32D42CeebD62D84CabbDd7Dd8CcdeD93Db5Dc5Ccb4D22Cfe8D23Cba3D55D65D75Cfe7D44D66CfccD51CbccDa1Dd4Dd5Ccb4D06D07D63D86CffbD64Ccb6D09Ca93D49D69D79Cdc5D04Ccb4D08D88Cba3D19D85" {
	run("Series Labeler")
}

// Image Stitching Tool 
macro "Image Stitching Action Tool - CfffD00D01D02D03D04D05D06D07D08D09D0aD0bD0cD0fD10D1fD20D22D23D25D26D28D29D2bD2cD2fD30D32D33D35D36D38D39D3bD3cD3fD40D4fD50D52D53D55D56D58D59D5bD5cD5fD60D62D63D65D66D68D69D6bD6cD6fD70D7fD80D82D83D85D86D88D89D8bD8cD8fD90D92D93D95D96D98D99D9bD9cD9fDa0DafDb0Db2Db3Db5Db6Db8Db9DbbDbcDbfDc0Dc2Dc3Dc5Dc6Dc8Dc9DcbDccDcfDd0DdfDe0De1De2De3De4De5De6De7De8De9DeaDebDecDefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfbDfcDfdDfeDffC555D12D13D21D31D41D42D43D51D61D71D72D73D81D91Da1Da2Da3Db1Dc1Dd2Dd3C444D16D17D18D27D37D46D48D57D67D76D78D87D97Da6Da8Db7Dc7Dd6Dd7Dd8C777D47D77Da7C333D19D1aD2aD3aD49D5aD6aD79D8aD9aDa9DbaDcaDd9DdaC666D4aD7aDaaC444D14D15D1dD24D34D45D54D64D75D84D94Da5Db4Dc4Dd4Dd5DddCfffD0eDeeC222D1cD4cD7cDacDdcCeeeD0dD1eD2eD3eD4eD5eD6eD7eD8eD9eDaeDbeDceDdeDedC777D11D44D74Da4Dd1C333D1bD4bD7bDabDdb" {
	run("Grid/Collection stitching");
}

// OrientationJ Menu
var ojCmds = newMenu("OrientationJ Menu Tool", 
newArray("Analysis", "Distribution", "Directions", "Measure", "Corner Harris", "Dominant Direction", "Documentation..."));
macro "OrientationJ Menu Tool - C48eD59Cd32D86CfffD12D21D7dDc1Dd2CaaaD72D7cCeeeD04D40Da0De4CcccD50D5dD90CfffD00D01D02D03D0bD0cD0dD0eD0fD10D11D1dD1eD1fD20D2eD2fD30D3eD3fD4fD5fD6fD7fD8fD9fDafDb0DbeDbfDc0Dd0Dd1De0De1De2De3DefDf0Df1Df2Df3Df4Df5Df6Df7Df8Df9DfaDfeDffC777D7eCbdeDfbCcccD19D47D51D57D74D79D7aD97D99Da7DaaDc3Dd5CbbbD09D22D70Dc2De9CeffD48D53D5bD5cD62D63D64D6aD6bD6cD82D83D84D8aD92D93Da6Da8Db8CdddD4eDaeC37dD68C8bfD3bCdbbDa5CabbD55D75CeeeD1cD2dD54D56D6dD89D98D9aDa9CcddD16D17D18D24D25D26D28D29D33D34D35D36D38D39D42D43D45D46D65Db5Dc4Dc5Dc6Dc8C58cD67CdeeD52Da2Dd7Dd8CeccD94CabdDeaCdccDb4C48cDcdC3cfDddCc54D87CbbbD06D14D1bDd4De6CeeeD71D81Db6Db9CcddD91C999D4dCdddD0aD73D77D7bDb7CbccD23D2bD32D3cD44Db2C59dDbbDdaCaceDeeCcccD05D13D31D60D80Db1Dd3De5CbbbD41Da1CaaaD2cCdeeD4cDbaCbccD15D37CeddDa3C37bD9dDceDdeC5aeDcaCe43D95CaaaD07D08D1aDe7De8C899D27Dc7CdddDd6CcbbD66D88C49dDcbC9efD9cDdbC69cDcfCacdDdfC48cDedC6dfDacCd99D85C999D3dD5eD9eC59dD9bDabDebCaceDfdC7bdD8bC59fD4aCc43D76C888D6eD8eCcdeD49D4bD5aC49cD8cDfcC7dfDecC5dfDbcDccDdcCe98Db3CaceD58D69C7beDc9Cf54Da4CdeeD2aD61C6acD8dC48cD78CeaaD96CbdeD3aC9bdDd9" {4
	cmd = getArgument();
	if (cmd == "Analysis")
		run("OrientationJ Analysis");
	else if (cmd == "Distribution")
		run("OrientationJ Distribution");
	else if (cmd == "Directions")
		run("OrientationJ Directions");
	else if (cmd == "Measure")
		run("OrientationJ Measure");
	else if (cmd == "Corner Harris")
		run("OrientationJ Corner Harris");
	else if (cmd == "Dominant Direction")
		run("OrientationJ Dominant Direction");
	else if (cmd == "Documentation...")
		run("URL...", "url=http://bigwww.epfl.ch/demo/orientation/");
}

// ^^Maximum number of macros to install cuts off right here^^
// Moved Temporal Color Code command into Stacks menu

macro "-" {} //menu divider

macro "About Startup Macros..." {
	title = "About Startup Macros";
	text = "Macros, such as this one, contained in a file named\n"
		+ "'StartupMacros.txt', located in the 'macros' folder inside the\n"
		+ "Fiji folder, are automatically installed in the Plugins>Macros\n"
		+ "menu when Fiji starts.\n"
		+ "\n"
		+ "More information is available at:\n"
		+ "<http://imagej.nih.gov/ij/developer/macro/macros.html>";
	dummy = call("fiji.FijiTools.openEditor", title, text);
}

macro "Save As JPEG... [j]" {
	quality = call("ij.plugin.JpegWriter.getQuality");
	quality = getNumber("JPEG quality (0-100):", quality);
	run("Input/Output...", "jpeg="+quality);
	saveAs("Jpeg");
}

macro "Save Inverted FITS" {
	run("Flip Vertically");
	run("FITS...", "");
	run("Flip Vertically");
}
