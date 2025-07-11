import SwiftUI
import UIPilot
@available(iOS 16.0, *)
@MainActor
final class NavigationCoordinator: ObservableObject {
    @Published var navPath = NavigationPath()
    private var routes: [AppRoute] = []
    
    func push(_ route: AppRoute) {
        navPath.append(route)
        routes.append(route)
    }
    
    func pop() {
        guard !navPath.isEmpty else { return }
        navPath.removeLast()
        routes.removeLast()
    }
    
    func popToRoot() {
        navPath.removeLast(navPath.count)
        routes.removeAll()
    }
    
    func popTo(_ route: AppRoute) {
        print("Inside PopTo \(routes)")
        
        routes.forEach { rot in
            print(rot)
        }
        
        guard let index = routes.lastIndex(of: route) else { return }
        print("Inside Index \(index)")
        let countToRemove = routes.count - index - 1
        navPath.removeLast(countToRemove)
        routes.removeLast(countToRemove)
    }
}


extension UIPilot: NavigationService where T == AppRoute {
    func backToRoot() {
        popTo(routes.first!)
    }
    
    func navigate(_ route: AppRoute) {
        print("\(route)")
        self.push(route)
    }
    
    func back() {
        pop()
    }
    
    func backTo(_ route: AppRoute) {
        popTo(route)
    }
}


@available(iOS 16.0, *)
extension NavigationCoordinator: NavigationService {
    func backToRoot() {
        popToRoot()
    }
    
    func navigate(_ route: AppRoute) {
        push(route)
    }
    
    func back() {
        pop()
    }
    
    func backTo(_ route: AppRoute) {
        popTo(route)
    }
}


@MainActor
protocol NavigationService: ObservableObject {
    
    func navigate(_ route: AppRoute)
    func back()
    func backTo(_ route : AppRoute)
    func backToRoot()
}

@MainActor
class Router: ObservableObject {
    @Published var isPopupVisible: Bool = false
    
    @Published var currentPopupRoute: AppRoute? = nil
    
    var navigationService: (any NavigationService)?
    
    func setNavigationService(_ service: any NavigationService) {
        print("navigate Service \(service)")
        self.navigationService = service
    }
    
     func push(_ route: AppRoute) {
         print("Router \(route)")
        navigationService?.navigate(route)
    }
    
    func pop() {
        navigationService?.back()
    }
    
    func popTo(_ route : AppRoute) {
        print("Router popTo \(route)")
        navigationService?.backTo(route)
    }
    
    func popToRoot() {
        navigationService?.backToRoot()
    }
    
    
    // ADD THESE NEW POPUP METHODS
        func showPopup(_ route: AppRoute) {
            currentPopupRoute = route
            withAnimation(.easeInOut(duration: 0.3)) {
                isPopupVisible = true
            }
        }
        
        func hidePopup() {
            withAnimation(.easeInOut(duration: 0.3)) {
                isPopupVisible = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.currentPopupRoute = nil
            }
        }
}
