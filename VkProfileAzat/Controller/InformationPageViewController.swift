import UIKit

class InformationPageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        chooseRightViewController()
    }
    
    lazy var viewControllerArray: [UIViewController] = {
        return [self.ViewControllerInstance(with: "FirstPageVC"),
                self.ViewControllerInstance(with: "SecondPageVC"),
                self.ViewControllerInstance(with: "ThirdPageVC")]
    }()
    
    private func ViewControllerInstance(with name: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    func chooseRightViewController() {
        if let firstViewController = viewControllerArray.first  {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArray.index(of: viewController) else {return nil}
        let previeousIndex = viewControllerIndex - 1
        
        guard previeousIndex >= 0  else {return viewControllerArray.last}
        
        guard viewControllerArray.count > previeousIndex else {return nil}
        
        return viewControllerArray[previeousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerArray.index(of: viewController) else {return nil}
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < viewControllerArray.count  else {return viewControllerArray.first}
        
        guard viewControllerArray.count > nextIndex else {return nil}
        
        return viewControllerArray[nextIndex]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerArray.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = viewControllers?.index(of: firstViewController) else {return 0}
        return firstViewControllerIndex
    }
    
}
