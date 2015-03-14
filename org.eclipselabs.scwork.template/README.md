org.eclipselabs.scwork.template
===============================

Description
-----------

Eclipse Scout templates: Xtend standalone implementation of the "New Scout Project..." feature of the Scout SDK.

Usage
-----

Example Main class:

```java
import java.io.File;
import java.util.List;

import org.eclipselabs.scwork.template.InputParam;
import org.eclipselabs.scwork.template.ProjectType;
import org.eclipselabs.scwork.template.TemplateUtility;
import org.eclipselabs.scwork.template.generator.IFileGenerator;

public class Main {

  /**
   * @param args
   */
  public static void main(String[] args) {
    InputParam param = new InputParam();

    //Folder where the projects will be generated:
    param.setWorkspaceFolder(new File("MyWorkspace"));

    //Project names:
    param.setProjectAlias("xyzOoo");
    param.setProjectName("aa.xyz");
    param.setProjectPostfix("ooo");

    //Flags to indicate which project should be created:
    param.setClientIncluded(true);
    param.setServerIncluded(true);
    param.setSharedIncluded(true);
    param.setUirapIncluded(true);
    param.setUiswtIncluded(true);
    param.setUiswingIncluded(true);

    //Type of application:
    param.setProjectType(ProjectType.OUTLINE_BASED_APPLICATION);

    //Additional configuration:
    param.setAuthorName("jbr");
    StringBuilder sb = new StringBuilder();
    sb.append("/*******************************************************************************\n");
    sb.append(" * Copyright (c) 2015 Jeremie Bresson.\n");
    sb.append(" * All rights reserved. This program and the accompanying materials\n");
    sb.append(" * are made available under the terms of the Eclipse Public License v1.0\n");
    sb.append(" * which accompanies this distribution, and is available at\n");
    sb.append(" * http://www.eclipse.org/legal/epl-v10.html\n");
    sb.append(" *\n");
    sb.append(" * Contributors:\n");
    sb.append(" *     Jeremie Bresson - initial API and implementation\n");
    sb.append(" *******************************************************************************/\n");
    param.setCopyrightHeader(sb.toString());
    param.setProjectVersion("2.0.0.qualifier");

    //Do the generation:
    List<IFileGenerator> generators = TemplateUtility.getAllGenerators();
    TemplateUtility.generateAll(generators, param);
  }
}
```

Get in touch / bug tracker
--------------------------

Use the [org.eclipselabs.scwork issue tracker](http://github.com/jmini/org.eclipselabs.scwork/issues) on GitHub.


Download
--------

There is no download for the moment.


License
-------

[Eclipse Public License - v 1.0](http://www.eclipse.org/legal/epl-v10.html)


