package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtUiPrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingOrgEclipseJdtUiPrefsGenerator extends AbstractOrgEclipseJdtUiPrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile(subFilePath())
	}
}
