class MMDrawerMenuButtonView < UIButton

  attr_accessor :menuButtonNormalColor
  attr_accessor :menuButtonHighlightedColor
  attr_accessor :shadowNormalColor
  attr_accessor :shadowHighlightedColor

  # def initWithFrame:(CGRect)frame{
  def initWithFrame(frame)
    # self = super.initWithFrame(frame)
    if(super)
        self.setMenuButtonNormalColor(UIColor.whiteColor.colorWithAlphaComponent(0.9))
        self.setMenuButtonHighlightedColor(UIColor.colorWithRed(139.0/255.0, green:135.0/255.0, blue:136.0/255.0, alpha:0.9))
        
        self.setShadowNormalColor(UIColor.blackColor.colorWithAlphaComponent(0.5))
        self.setShadowHighlightedColor(UIColor.blackColor.colorWithAlphaComponent(0.2))
    end
    return self
  end 

  # def menuButtonColorForState:(UIControlState)state{
  def menuButtonColorForState(state)
      color = UIColor.greenColor # A default color just in case, get it, that was funny.

      case (state)
      when UIControlStateNormal
        color = self.menuButtonNormalColor
      when UIControlStateHighlighted
        color = self.menuButtonHighlightedColor
      end

      return color
  end 

  # def setMenuButtonColor:(UIColor *)color forState:(UIControlState)state{
  def setMenuButtonColor(color, forState:state)
      case (state)
      when UIControlStateNormal
        self.setMenuButtonNormalColor(color)
      when UIControlStateHighlighted
        self.setMenuButtonHighlightedColor(color)
      end

      self.setNeedsDisplay
  end 

  # def shadowColorForState:(UIControlState)state{
  def shadowColorForState(state)
      color = UIColor.redColor # A default color 

      case (state)
      when UIControlStateNormal
        color = self.shadowNormalColor
      when UIControlStateHighlighted
        color = self.shadowHighlightedColor
      end

      return color
  end 

  # def setShadowColor:(UIColor *)color forState:(UIControlState)state{
  def setShadowColor(color, forState:state)
      case (state)
      when UIControlStateNormal
        self.setShadowNormalColor(color)
      when UIControlStateHighlighted
        self.setShadowHighlightedColor(color)
      end
      self.setNeedsDisplay
  end 

  # def drawRect:(CGRect)rect{
  def drawRect(rect)
      # General Declarations
      context = UIGraphicsGetCurrentContext() #CGContextRef 
      
      # Sizes
      buttonWidth = CGRectGetWidth(self.bounds) * 0.80
      buttonHeight = CGRectGetHeight(self.bounds) * 0.16
      xOffset = CGRectGetWidth(self.bounds) * 0.10
      yOffset = CGRectGetHeight(self.bounds) * 0.12
      cornerRadius = 1.0
      
      # Color Declarations
      buttonColor = self.menuButtonColorForState(self.state)
      shadowColor = self.shadowColorForState(self.state)

      
      # Shadow Declarations
      shadow =  shadowColor
      shadowOffset = CGSizeMake(0.0, 1.0)
      shadowBlurRadius = 0
      
      # Top Bun Drawing
      topBunPath = UIBezierPath.bezierPathWithRoundedRect(CGRectMake(xOffset, yOffset, buttonWidth, buttonHeight), cornerRadius:cornerRadius) # UIBezierPath
      CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor)
        buttonColor.setFill
        topBunPath.fill
      CGContextRestoreGState(context)
      
      # Meat Drawing
      meatPath = UIBezierPath.bezierPathWithRoundedRect(CGRectMake(xOffset, yOffset*2 + buttonHeight, buttonWidth, buttonHeight), cornerRadius:cornerRadius) # UIBezierPath* 
      CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor)
        buttonColor.setFill
        meatPath.fill
      CGContextRestoreGState(context)
      
      # Bottom Bun Drawing
      bottomBunPath = UIBezierPath.bezierPathWithRoundedRect(CGRectMake(xOffset, yOffset*3 + buttonHeight*2, buttonWidth, buttonHeight), cornerRadius:cornerRadius) # UIBezierPath* 
      CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor)
        buttonColor.setFill
        bottomBunPath.fill
      CGContextRestoreGState(context)
  end 

  # def touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  def touchesBegan(touches, withEvent:event)
    super
    self.setNeedsDisplay
  end 

  # def touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
  def touchesEnded(touches, withEvent:event)
    super
    self.setNeedsDisplay
  end 

  # def touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
  def touchesCancelled(touches, withEvent:event)
    super
    self.setNeedsDisplay
  end 

  # def setSelected:(BOOL)selected{
  def selected=(selected)
    super
    self.setNeedsDisplay
  end 

  # def setHighlighted:(BOOL)highlighted{
  def highlighted=(highlighted) 
    super
    self.setNeedsDisplay
  end

end