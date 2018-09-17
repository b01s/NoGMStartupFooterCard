@interface AZScrollingCardsFooterViewController : UIViewController
@end

@interface GOOUINavigationController : UIViewController
@end

@interface RootViewController : UIViewController
- (void)homeScreenTabBar:(id)arg1 didSelectTabItem:(id)arg2;
@end

@interface AZHomeScreenTabItem : NSObject
- (BOOL)isEqual:(id)arg1;
@end

@interface AZHomeScreenTabBar : UIView
@property(retain, nonatomic) AZHomeScreenTabItem *selectedItem; // @synthesize selectedItem=_selectedItem;
- (void)didTapButton:(id)arg1;
@end

@interface AZHomeScreenTabBarController : NSObject
@property(readonly, nonatomic) AZHomeScreenTabBar *tabBarView; // @synthesize tabBarView=_tabBarView;
- (void)homeScreenTabBar:(AZHomeScreenTabBar*)arg1 didSelectTabItem:(AZHomeScreenTabItem*)arg2;
@end

@interface AZUINavigationController : GOOUINavigationController
- (void)viewDidLoad;
@property(readonly, nonatomic) AZHomeScreenTabBarController *tabBarController; // @synthesize tabBarController=_tabBarController;
@end

@interface AZAssistiveStreamFooterViewController : AZScrollingCardsFooterViewController
- (void)setChromeHidden:(_Bool)arg1 animated:(_Bool)arg2;
- (void)footerViewWillAppear:(_Bool)arg1;
@end

AZAssistiveStreamFooterViewController *footerViewController = nil;
AZHomeScreenTabItem *oldTabItem = nil;

%hook AZAssistiveStreamFooterViewController
- (void)footerViewWillAppear:(_Bool)arg1 {
    %orig(arg1);
    [self setChromeHidden:YES animated:NO];
    footerViewController = self;
}
%end

%hook AZUINavigationController
- (void)viewDidLoad {
    %orig;
    self.tabBarController.tabBarView.selectedItem = nil;
}
%end

%hook AZHomeScreenTabBar
- (void)didTapButton:(id)arg1 {
    oldTabItem = self.selectedItem;
    %orig(arg1);
}
%end

%hook AZHomeScreenTabBarController
- (void)homeScreenTabBar:(AZHomeScreenTabBar*)arg1 didSelectTabItem:(AZHomeScreenTabItem*)arg2 {
    %orig(arg1, arg2);
    if ([oldTabItem isEqual:arg2]) {
        [footerViewController setChromeHidden:YES animated:YES];
    }
}
%end

