class APGAwesomeView < UIView 

  # This class is pretty much SAMGradientView with some additions of my own to give the gradients alpha transparency
  # https://github.com/soffes/SAMGradientView


  attr_accessor :gradient
  attr_accessor :gradientColors
  attr_accessor :gradientLocations
  attr_accessor :gradientDirection
  attr_accessor :useThinBorders
  attr_accessor :topBorderColor
  attr_accessor :topInsetColor
  attr_accessor :rightBorderColor
  attr_accessor :rightInsetColor
  attr_accessor :bottomBorderColor
  attr_accessor :bottomInsetColor
  attr_accessor :leftBorderColor
  attr_accessor :leftInsetColor

  # iOS7
  attr_accessor :dimmedGradientColors

  APGGradientViewDirectionVertical = 0
  APGGradientViewDirectionHorizontal = 1


  def gradient=(gradient)
    if (@gradient)
      CGGradientRelease(@gradient)
    end

    @gradient = gradient
    self.setNeedsDisplay
  end


  def gradientColors=(colors)
    @gradientColors = colors
    self.refreshGradient
  end


  def gradientLocations=(locations)
    @gradientLocations = locations
    # ap "Set some locations = #{locations}"
    self.refreshGradient
  end


  def gradientDirection=(direction)
    @gradientDirection = direction
    self.setNeedsDisplay
  end


  #ifdef __IPHONE_7_0 

  # def dimmedGradientColors
  #   puts "[APGAwesomeView] -  UHOH DOING SOME IOS 7 STUFF ----------!!!!!!!!"

  #   if (!@dimmedGradientColors)
  #     dimmed = self.gradientColors

  #     dimmed.each_with_index do |color, index|
  #       hue        = Pointer.new(:float)
  #       saturation = Pointer.new(:float)
  #       brightness = Pointer.new(:float)
  #       alpha      = Pointer.new(:float)

  #       color.getHue(hue, saturation(saturation, brightness:brightness, alpha:alpha))
  #       # dimmed.replaceObjectAtIndex(index, withObject(UIColor.colorWithHue(hue, saturation:0, brightness:brightness, alpha:alpha)))
  #       dimmed[index] = UIColor.colorWithHue(hue[0], saturation:0, brightness:brightness[0], alpha:alpha[0])
  #     end

  #     return dimmed
  #   end

  #   return @dimmedGradientColors
  # end


  # def dimmedGradientColors=(colors)
  #   @dimmedGradientColors = colors
  #   self.refreshGradient
  # end

  #endif 

  def useThinBorders=(useThinBorders)
    @useThinBorders = useThinBorders
    self.setNeedsDisplay
  end


  def topBorderColor=(topBorderColor)
    @topBorderColor = topBorderColor
    self.setNeedsDisplay
  end


  def topInsetColor=(topInsetColor)
    @topInsetColor = topInsetColor
    self.setNeedsDisplay
  end


  def rightBorderColor=(rightBorderColor)
    @rightBorderColor = rightBorderColor
    self.setNeedsDisplay
  end


  def rightInsetColor=(rightInsetColor)
    @rightInsetColor = rightInsetColor
    self.setNeedsDisplay
  end


  def bottomBorderColor=(bottomBorderColor)
    @bottomBorderColor = bottomBorderColor
    self.setNeedsDisplay
  end


  def bottomInsetColor=(bottomInsetColor)
    @bottomInsetColor = bottomInsetColor
    self.setNeedsDisplay
  end


  def leftBorderColor=(leftBorderColor)
    @leftBorderColor = leftBorderColor
    self.setNeedsDisplay
  end


  def leftInsetColor=(leftInsetColor)
    @leftInsetColor = leftInsetColor
    self.setNeedsDisplay
  end

  def dealloc
    @gradient = nil
  end


  def initWithFrame(frame)
    if super
      self.startItUp
    end
    self
  end


  def drawRect(rect)
    context = UIGraphicsGetCurrentContext() #CGContextRef

    size = self.bounds.size
    borderWidth = self.useThinBorders ? 1 / UIScreen.mainScreen.scale : 1
    # borderWidth = 1

    # GRADIENT
    if (self.gradient)
      start = [0, 0]
      ending = self.gradientDirection == APGGradientViewDirectionVertical ? [0, size.height] : [size.width, 0]
      CGContextDrawLinearGradient(context, self.gradient, start, ending, KCGGradientDrawsBeforeStartLocation | KCGGradientDrawsAfterEndLocation)
    end

    # TOP
    if (self.topBorderColor)
      # TOP Border
      CGContextSetFillColorWithColor(context, self.topBorderColor.CGColor)
      CGContextFillRect(context, CGRectMake(0, 0, size.width, borderWidth))

      # TOP Inset
      if (self.topInsetColor)
        CGContextSetFillColorWithColor(context, self.topInsetColor.CGColor)
        CGContextFillRect(context, CGRectMake(0, borderWidth, size.width, borderWidth))
      end
    end

    sideY = self.topBorderColor ? borderWidth : 0
    sideHeight = size.height

    if @topBorderColor
      sideHeight -= borderWidth
    end

    if @bottomBorderColor
      sideHeight -= borderWidth
    end

    # RIGHT
    if (self.rightBorderColor) 
      if (self.rightInsetColor) 
        CGContextSetFillColorWithColor(context, self.rightInsetColor.CGColor)
        CGContextFillRect(context, CGRectMake(size.width - borderWidth - borderWidth, sideY, borderWidth, sideHeight))
      end

      CGContextSetFillColorWithColor(context, self.rightBorderColor.CGColor)
      CGContextFillRect(context, CGRectMake(size.width - borderWidth, sideY, borderWidth, sideHeight))
    end

    # BOTTOM
    if (self.bottomBorderColor) 
      if (self.bottomInsetColor) 
        CGContextSetFillColorWithColor(context, self.bottomInsetColor.CGColor)
        CGContextFillRect(context, CGRectMake(0, rect.size.height - borderWidth - borderWidth, size.width, borderWidth))
      end

      CGContextSetFillColorWithColor(context, self.bottomBorderColor.CGColor)
      CGContextFillRect(context, CGRectMake(0, rect.size.height - borderWidth, size.width, borderWidth))
    end

    # LEFT
    if (self.leftBorderColor) 
      if (self.leftInsetColor)
        CGContextSetFillColorWithColor(context, self.leftInsetColor.CGColor)
        CGContextFillRect(context, CGRectMake(borderWidth, sideY, borderWidth, sideHeight))
      end

      CGContextSetFillColorWithColor(context, self.leftBorderColor.CGColor)
      CGContextFillRect(context, CGRectMake(0, sideY, borderWidth, sideHeight))
    end
  end

  #ifdef __IPHONE_7_0
  # def tintColorDidChange
  #   super.tintColorDidChange
  #   self.refreshGradient
  # end
  #endif

  #pragma mark - Private 
  def startItUp
    self.contentMode = UIViewContentModeRedraw
    self.gradientDirection = APGGradientViewDirectionVertical
  end

  def refreshGradient

    #ifdef __IPHONE_7_0
    # if (self.respondsToSelector("tintAdjustmentMode") && self.tintAdjustmentMode == UIViewTintAdjustmentModeDimmed)
    #   puts "[APGAwesomeView] - UHOH DOING SOME IOS 7 STUFF ----------!!!!!!!!"
    #   locations = self.dimmedGradientColors.length == self.gradientLocations.length ? self.gradientLocations : nil
    #   self.gradient = APGGradientCreateWithColorsAndLocations(self.dimmedGradientColors, locations)
    #   return
    # end
    #endif

    @gradient = APGGradientCreateWithColorsAndLocations(self.gradientColors, self.gradientLocations)
  end

end



#pragma mark - Drawing Functions 

def APGGradientCreateWithColors(colors)
  return APGGradientCreateWithColorsAndLocations(colors, nil)
end


def APGGradientCreateWithColorsAndLocations(colors, locations)
  # ap "Colors: #{colors}"
  # ap "Locations: #{locations}"
  colorsCount     = colors ? colors.length : 0
  locationsCount  = locations ? locations.length : 2

  ccCount = colorsCount * 4

  if (colorsCount < 2) 
    return nil
  end

  colorSpace = CGColorSpaceCreateDeviceRGB()

  gradientColorComponents = Pointer.new(:float, colorsCount * 4)

  index_offset = 0
  temp_cc = []
  colors.each do |color|
    colorComponents = CGColorGetComponents(color.CGColor)

    # Convert Pointer to Array
    (0..3).each do |i|
      # ap "add #{i} colorComp to temp_cc"
      temp_cc[i] = colorComponents[i]
    end

    # Add Array to new Pointer
    temp_cc.each_with_index do |cc, i|
      ci = i + index_offset
      gradientColorComponents[ci] = cc
    end

    index_offset = temp_cc.length
  end

  gradientLocations = Pointer.new(:float, locationsCount)

  if locations && locationsCount == colorsCount
    locations.each_with_index do |location, i|
      gradientLocations[i] = location
    end
  end

  gradient = CGGradientCreateWithColorComponents(colorSpace, gradientColorComponents, gradientLocations, locationsCount)
  CGColorSpaceRelease(colorSpace)

  # if (gradientLocations) {
  #   free(gradientLocations)
  # }

  return gradient
end


# def APGDrawGradientInRect(context, gradient, rect)
#   CGContextSaveGState(context)
#   CGContextClipToRect(context, rect)
#   start = CGPointMake(rect.origin.x, rect.origin.y)
#   ending = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height)
#   CGContextDrawLinearGradient(context, gradient, start, ending, 0)
#   CGContextRestoreGState(context)
# end