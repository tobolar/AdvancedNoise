within AdvancedNoise.Applications.Examples;
package CompareInterpolators
  extends Modelica.Icons.ExamplesPackage;

  model ComparePerformanceFixedGrid
    extends Modelica.Icons.Example;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ComparePerformanceFixedGrid;

  model FixedGridRoadClassD_1782Pt
    extends AdvancedNoise.Applications.BaseClasses.BaseRoad;
  end FixedGridRoadClassD_1782Pt;
end CompareInterpolators;
