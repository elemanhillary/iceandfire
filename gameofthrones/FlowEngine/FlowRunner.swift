//
//  FlowRunner.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class FlowRunner: FlowRunnerProtocol {
    func runHomeFlow(parentView: CardHolderViewControllerProtocol, apiUrl: String) {
        let homeFlowPerformer = HomeFlowPerformer(parentView: parentView, flowRunner: FlowRunner(), repository: GetHousesRepository())
        let engine = FlowEngine(flowPerformer: homeFlowPerformer, flow: HomeFlow())
        engine.begin(initialState: .init(apiUrl: apiUrl))
    }
    func runDetailFlow(navigationController: UINavigationController, houseUrl: String) {
        let detailFlowPerformer = DetailFlowPerformer(navigationController: navigationController, flowRunner: FlowRunner(), repository: GetHouseRepository())
        let engine = FlowEngine(flowPerformer: detailFlowPerformer, flow: DetailFlow())
        engine.begin(initialState: .init(houseUrl: houseUrl))
    }
}
