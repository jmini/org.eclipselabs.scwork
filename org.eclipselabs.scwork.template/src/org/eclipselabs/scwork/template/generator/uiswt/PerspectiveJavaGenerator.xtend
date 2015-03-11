package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class PerspectiveJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtSourceFile(#["perspective", "Perspective.java"])
	}
	
	override provideContent(InputParam param) 
'''
package «param.uiswtProjectName».perspective;

import org.eclipse.ui.IPageLayout;
import org.eclipse.ui.IPerspectiveFactory;
import org.eclipse.ui.IPlaceholderFolderLayout;
import org.eclipse.ui.IViewLayout;
import org.eclipse.ui.progress.IProgressConstants;

import «param.uiswtProjectName».views.CenterView;
import «param.uiswtProjectName».views.EastView;
import «param.uiswtProjectName».views.NorthEastView;
import «param.uiswtProjectName».views.NorthView;
import «param.uiswtProjectName».views.NorthWestView;
import «param.uiswtProjectName».views.SouthEastView;
import «param.uiswtProjectName».views.SouthView;
import «param.uiswtProjectName».views.SouthWestView;
import «param.uiswtProjectName».views.WestView;

public class Perspective implements IPerspectiveFactory {

  public static final String ID = Perspective.class.getName();
  public static final String FOLDER_CENTER = ID + ".folders.center";
  public static final String FOLDER_NORTH = ID + ".folders.north";
  public static final String FOLDER_NORTH_EAST = ID + ".folders.northeast";
  public static final String FOLDER_EAST = ID + ".folders.east";
  public static final String FOLDER_SOUTH_EAST = ID + ".folders.southeast";
  public static final String FOLDER_SOUTH = ID + ".folders.south";
  public static final String FOLDER_SOUTH_WEST = ID + ".folders.southwest";
  public static final String FOLDER_WEST = ID + ".folders.west";
  public static final String FOLDER_NORTH_WEST = ID + ".folders.northwest";

  private static final String ALL_SECONDARY_VIEW_IDS = ":*";

  @Override
  public void createInitialLayout(IPageLayout layout) {
    layout.setEditorAreaVisible(false);

    IPlaceholderFolderLayout folder = layout.createPlaceholderFolder(FOLDER_WEST, IPageLayout.LEFT, 0.2f, IPageLayout.ID_EDITOR_AREA);
    folder.addPlaceholder(WestView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    // create a folder instead of a placeholder to ensure the space of the center view is always visible.
    folder = layout.createFolder(FOLDER_CENTER, IPageLayout.RIGHT, 0.6f, IPageLayout.ID_EDITOR_AREA);
    folder.addPlaceholder(CenterView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_EAST, IPageLayout.RIGHT, 0.6f, FOLDER_CENTER);
    folder.addPlaceholder(EastView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_NORTH, IPageLayout.TOP, 0.2f, FOLDER_CENTER);
    folder.addPlaceholder(NorthView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_NORTH_WEST, IPageLayout.TOP, 0.2f, FOLDER_WEST);
    folder.addPlaceholder(NorthWestView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_NORTH_EAST, IPageLayout.TOP, 0.2f, FOLDER_EAST);
    folder.addPlaceholder(NorthEastView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_SOUTH, IPageLayout.BOTTOM, 0.6f, FOLDER_CENTER);
    folder.addPlaceholder(SouthView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_SOUTH_WEST, IPageLayout.BOTTOM, 0.6f, FOLDER_WEST);
    folder.addPlaceholder(SouthWestView.class.getName() + ALL_SECONDARY_VIEW_IDS);

    folder = layout.createPlaceholderFolder(FOLDER_SOUTH_EAST, IPageLayout.BOTTOM, 0.6f, FOLDER_EAST);
    folder.addPlaceholder(SouthEastView.class.getName() + ALL_SECONDARY_VIEW_IDS);
    folder.addPlaceholder(IProgressConstants.PROGRESS_VIEW_ID);

    IViewLayout outlineLayout = layout.getViewLayout(NorthWestView.class.getName());
    if (outlineLayout != null) {
      outlineLayout.setCloseable(false);
      outlineLayout.setMoveable(false);
    }
  }
}
'''
}
