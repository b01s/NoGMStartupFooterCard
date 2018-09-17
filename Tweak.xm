@interface AZScrollingCardsFooterViewController : UIViewController
@end

@interface GOOUINavigationController : UIViewController
@end

@interface AZHomeScreenTabItem : NSObject
@end

@interface AZHomeScreenTabBar : UIView
//@property(retain, nonatomic) AZHomeScreenTabItem *selectedItem; // @synthesize selectedItem=_selectedItem;
- (void) setSelectedItem:(id)arg1;
@end

@interface AZHomeScreenTabBarController : NSObject
@property(readonly, nonatomic) AZHomeScreenTabBar *tabBarView; // @synthesize tabBarView=_tabBarView;
@end

@interface AZUINavigationController : GOOUINavigationController
- (void)viewDidLoad;
@property(readonly, nonatomic) AZHomeScreenTabBarController *tabBarController; // @synthesize tabBarController=_tabBarController;
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

%hook AZUINavigationController

- (void)viewDidLoad {
    %orig;
    [[self.tabBarController tabBarView] setSelectedItem:nil];
}

%end
