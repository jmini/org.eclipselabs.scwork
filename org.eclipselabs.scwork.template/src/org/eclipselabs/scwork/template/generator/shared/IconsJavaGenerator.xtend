package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class IconsJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedSourceFile(#["Icons.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.sharedProjectName»;

import org.eclipse.scout.rt.shared.AbstractIcons;

public class Icons extends AbstractIcons {
  private static final long serialVersionUID = 1L;

  public static final String Eye = "eye";
  public static final String EclipseScout = "eclipse_scout";
}
'''
}
