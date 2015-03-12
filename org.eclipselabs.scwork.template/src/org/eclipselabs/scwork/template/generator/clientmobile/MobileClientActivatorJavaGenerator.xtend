package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientActivatorJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileSourceFile(#["Activator.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.clientmobileProjectName»;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

public class Activator implements BundleActivator {

  private static BundleContext context;

  public static BundleContext getContext() {
    return context;
  }

  @Override
  public void start(BundleContext bundleContext) throws Exception {
    Activator.context = bundleContext;
  }

  @Override
  public void stop(BundleContext bundleContext) throws Exception {
    Activator.context = null;
  }
}
'''
}
