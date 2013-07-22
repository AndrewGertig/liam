class UINavigationBar

  def configureFlatNavigationBarWithColor(color)
    self.setBackgroundImage(UIImage.imageWithColor(color, cornerRadius:0), forBarMetrics:(UIBarMetricsDefault & UIBarMetricsLandscapePhone))

    titleTextAttributes = self.titleTextAttributes

    if (!titleTextAttributes)
      titleTextAttributes = {}
    end

    # titleTextAttributes.setValue(UIColor.clearColor, forKey:UITextAttributeTextShadowColor)
    titleTextAttributes[UITextAttributeTextShadowColor] = UIColor.clearColor
    titleTextAttributes[UITextAttributeTextShadowOffset] = NSValue.valueWithUIOffset(UIOffsetMake(0, 0))

    self.setTitleTextAttributes(titleTextAttributes)

    if(self.respondsToSelector("setShadowImage"))
      self.setShadowImage(UIImage.imageWithColor(UIColor.clearColor, cornerRadius:0))
    end
  end

end