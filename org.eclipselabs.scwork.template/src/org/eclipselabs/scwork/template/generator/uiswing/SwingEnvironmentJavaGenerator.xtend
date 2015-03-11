package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingEnvironmentJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingSourceFile(#["SwingEnvironment.java"])
	}
	
	override provideContent(InputParam param) 
'''
package «param.uiswingProjectName»;

import org.eclipse.scout.rt.ui.swing.DefaultSwingEnvironment;

public class SwingEnvironment extends DefaultSwingEnvironment {

}
'''
}
