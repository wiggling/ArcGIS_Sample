//
//  ViewController.swift
//  ArcGIS_Sample
//
//  Created by tnk on 2016/08/10.
//  Copyright © 2016年 goga.co.jp. All rights reserved.
//

import UIKit
import ArcGIS

class ViewController: UIViewController, AGSMapViewLayerDelegate {

	@IBOutlet weak var mapView: AGSMapView!
	var webMap: AGSWebMap!

	override func viewDidLoad() {
		super.viewDidLoad()

		// ArcGIS Runtime Basicライセンス認証
		let clientID = "<my_client_ID>"
		do {
			try AGSRuntimeEnvironment.setClientID(clientID)
		}
		catch {
			print("setClientID failed: \(error)")
		}

		// Webマップの取得
		self.webMap = AGSWebMap(itemId: "c59da60680024f2f87f444c7ddc82fb2", credential: nil)

		// AGSMapViewでWebマップを開く
		self.webMap.openIntoMapView(self.mapView)

		// AGSMapViewのデリゲート設定
		self.mapView.layerDelegate = self
	}

	// AGSMapViewのデリゲートメソッド（地図ロード完了時に実行される）
	func mapViewDidLoad(mapView: AGSMapView!) {

		// 位置情報の表示モードを設定
		self.mapView.locationDisplay.autoPanMode = .Default

		// 地図が現在位置にズームされる際の表示縮尺の設定
		self.mapView.locationDisplay.zoomScale = 100000

		// 現在位置の表示を開始
		self.mapView.locationDisplay.startDataSource()
	}
}

