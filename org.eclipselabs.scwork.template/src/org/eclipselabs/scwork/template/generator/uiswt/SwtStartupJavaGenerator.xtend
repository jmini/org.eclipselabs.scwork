package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwtStartupJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtSourceFile(#["SwtStartup.java"])
	}
	
	override provideContent(InputParam param) 
'''
package «param.uiswtProjectName»;

import org.eclipse.scout.rt.ui.swt.AbstractSwtStartup;
import org.eclipse.scout.rt.ui.swt.ISwtEnvironment;

/**
 * <h3>SwtStartup</h3> The startup class is registered as an extension in the plugin.xml.
 * It is used to be aware that the Workbench is ready.
 * 
 * @see AbstractSwtStartup
 */
public class SwtStartup extends AbstractSwtStartup {
  @Override
  protected ISwtEnvironment getSwtEnvironment() {
    return Activator.getDefault().getEnvironment();
  }
}
'''
}
