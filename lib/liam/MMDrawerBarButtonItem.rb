class MMDrawerBarButtonItem < UIBarButtonItem

  attr_accessor :buttonView

  # def initWithTarget:(id)target action:(SEL)action{
  def initWithTarget(target, action:action)

      buttonView = MMDrawerMenuButtonView.alloc.initWithFrame([[0, 0], [26, 26]])
      buttonView.addTarget(target, action:action, forControlEvents:UIControlEventTouchUpInside)

      self.initWithCustomView(buttonView)

      if self
        self.buttonView = buttonView
      end

      return self

  end

  def menuButtonColorForState(state)
      return self.buttonView.menuButtonColorForState(state)
  end

  def setMenuButtonColor(color, forState:state)
      self.buttonView.setMenuButtonColor(color, forState:state)
  end

  def shadowColorForState(state)
      return self.buttonView.shadowColorForState(state)
  end

  def setShadowColor(color, forState:state)
    # state = UIControlState
    self.buttonView.setShadowColor(color, forState:state)
  end

end