package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class TextsPropertiesGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedFile(#["resources", "texts", "Texts.properties"])
	}
	
	override provideContent(InputParam param) 
'''
AboutMenu=&About...
ApplicationTitle=My Application
AuthorizationFailed=Permission denied
ExitMenu=E&xit
ExportToExcelDiagramMenu=Export to Excel &diagram
ExportToExcelMenu=Export to &Excel
FileMenu=&File
HelpMenu=&?
Info=Info
Logoff=Log off
StandardOutline=Standard
ToolsMenu=&Tools
'''
}
