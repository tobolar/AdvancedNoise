within Modelica_Noise.Math.Random.Utilities.Interpolators.SmoothIdealLowPass;
function der_interpolate "Interpolates the buffer using a replaceable kernel"
  extends Modelica.Icons.Function;
  input Real buffer[:] "Buffer of random numbers";
  input Real offset "Offset from buffer start (0..size(buffer)-1";
  input Real der_buffer[size(buffer,1)] "Derivatives of buffer values";
  input Real der_offset "Derivative of offset value";
  output Real der_y "Interpolated value at position offset";
algorithm
  // For a general kernel based interpolation:
  // y   = sum( (K(-o)   * b[i])  )
  // y'  = sum( (K(-o)   * b[i])' )
  //     = sum(  K(-o)'  * b[i]        + K(o) * b[i]' )
  //     = sum( -dK/do*o'* b[i]        + K(o) * b[i]' )
  //     = sum( -dK/do   * b[i] ) * o'
  //     + sum(                          K(o) * b[i]' )

  // Initialize the convolution algorithm
  der_y   := 0;

  // Calculate weighted sum over -nPast...nFuture random samples
  for i in -nPast:nFuture loop
    der_y := der_y + der_kernel_offset(t=mod(offset,1)-i) *     buffer[integer(offset)+i+1] * der_offset
                   +     kernel(       t=mod(offset,1)-i) * der_buffer[integer(offset)+i+1];
  end for;
  annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><code>der_y = SmoothIdealLowPass.der_<b>interpolate</b>(buffer,offset,der_buffer,der_offset); </code></blockquote>
<h4>Description</h4>
<p>Determine the derivative of a signal interpolated smoothly in a buffer (see <a href=\"interpolate\">interpolate</a>). Input argument offset is a Real number marking the point at which interpolation shall take place. Input arguments der_buffer and der_offset are the derivatives of the input arguments buffer and offset. This function is used as derivative of the <a href=\"interpolate\">interpolate</a> function. Please see the description there for an introduction to the interpolation method used and specific remerks in the buffer and offset values.</p>
</html>"));
end der_interpolate;
