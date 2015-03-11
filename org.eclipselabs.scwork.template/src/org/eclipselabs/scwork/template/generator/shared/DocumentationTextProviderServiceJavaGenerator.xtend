package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class DocumentationTextProviderServiceJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedSourceFile(#["services", "common", "text", param.projectAlias.toFirstUpper + "DocumentationTextProviderService.java"])
	}
	
	override provideContent(InputParam param) 
'''
package «param.sharedProjectName».services.common.text;

import org.eclipse.scout.rt.shared.services.common.text.AbstractDynamicNlsDocumentationTextProviderService;

public class «param.projectAlias.toFirstUpper»DocumentationTextProviderService extends AbstractDynamicNlsDocumentationTextProviderService {

  @Override
  protected String getDynamicNlsBaseName() {
    return "resources.docs.Docs";
  }
}
'''
}
