package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class StandaloneRwtEnvironmentJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapSourceFile(#["StandaloneRwtEnvironment.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.uirapProjectName»;

import org.eclipse.scout.rt.ui.rap.AbstractStandaloneRwtEnvironment;

import «param.clientProjectName».ClientSession;

public class StandaloneRwtEnvironment extends AbstractStandaloneRwtEnvironment {

  public StandaloneRwtEnvironment() {
    super(Activator.getDefault().getBundle(), ClientSession.class);
  }
}
'''
}
