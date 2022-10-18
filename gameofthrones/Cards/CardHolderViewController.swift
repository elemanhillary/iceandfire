//
//  CardHolderViewController.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

protocol CardHolderViewControllerProtocol {
    var navigationController: UINavigationController? { get }
    func setTopChildViewController(_ controller: UIViewController)
    func setCard1ChildViewController(_ viewController: UIViewController)
}

class CardHolderViewController: UIViewController {
    
    lazy var customView = view as! CardHolder
    override func loadView() {
        view = CardHolder(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    private func remove(_ child: UIViewController) {
        guard child.parent != nil else { return }
        child.willMove(toParent: self)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
    private func setCardChildViewController(_ controller: UIViewController, host: CardView){
        add(controller)
        host.addSubview(controller.view)
        host.backgroundColor = host.backgroundColor
        controller.view.frame =  .init(origin: host.bounds.origin, size: .init(width: host.bounds.width, height: host.bounds.height))
    }
    
    func setTopChildViewController(_ controller: UIViewController) {
        add(controller)
        customView.topView.addSubview(controller.view)
        let origin = CGPoint(x: 0, y: CardHolder.Constants.minCardTopMargin)
        let size = CGSize(width: customView.topView.frame.size.width, height: customView.topView.frame.size.height - CardHolder.Constants.subviewBottomOffset - CardHolder.Constants.minCardTopMargin)
        controller.view.frame = .init(origin: origin, size: size)
    }
    
    func setCard1ChildViewController(_ viewController: UIViewController) {
        setCardChildViewController(viewController, host: customView.cardView1)
    }
}

extension CardHolderViewController: CardHolderViewControllerProtocol {}
