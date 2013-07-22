class UIImage
  # Extends UIImage for Flat NavBar

  def self.edgeSizeFromCornerRadius(cornerRadius)
      return cornerRadius * 2 + 1
  end

  def self.imageWithColor(color, cornerRadius:cornerRadius)
      minEdgeSize = edgeSizeFromCornerRadius(cornerRadius)
      rect = CGRectMake(0, 0, minEdgeSize, minEdgeSize)
      roundedRect = UIBezierPath.bezierPathWithRoundedRect(rect, cornerRadius:cornerRadius)
      roundedRect.lineWidth = 0
      UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
      color.setFill
      roundedRect.fill
      roundedRect.stroke
      roundedRect.addClip
      image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return image.resizableImageWithCapInsets(UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius))
  end

end