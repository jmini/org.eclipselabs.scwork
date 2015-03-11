package org.eclipselabs.scwork.template.generator;

import org.eclipselabs.scwork.template.InputParam;

public interface ITextFileGenerator extends IFileGenerator {

  String provideContent(InputParam param);

}
