@interface AZScrollingCardsFooterViewController : UIViewController
@end

@interface AZAssistiveStreamFooterViewController : AZScrollingCardsFooterViewController
- (void)setChromeHidden:(_Bool)arg1 animated:(_Bool)arg2;
- (void)footerViewWillAppear:(_Bool)arg1;

@end

%hook AZAssistiveStreamFooterViewController

- (void)footerViewWillAppear:(_Bool)arg1 {
    %orig(arg1);
    [self setChromeHidden:YES animated:NO];
}

%end
