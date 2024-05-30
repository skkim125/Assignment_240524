//
//  RestaruntMapViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/30/24.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    @IBOutlet var restaurantMapView: MKMapView!
    var restaurants: [Restaurant] = RestaurantList().restaurantArray
    var filterdRestaurant: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        
        // 맵뷰 기본 위치 지정
        let sesac = CLLocationCoordinate2D(latitude: 37.517742, longitude: 126.886463)
        restaurantMapView.region = MKCoordinateRegion(center: sesac, latitudinalMeters: 500, longitudinalMeters: 500)
        
        showAnnotation(restaurants: filterdRestaurant)
    }
    
    // 네비게이션바 UI
    func navigationUI() {
        navigationItem.title = "위치 정보"
        
        let filter = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterButtonClicked))
        navigationItem.rightBarButtonItem = filter
    }
    
    // alert 버튼 메서드
    @objc func filterButtonClicked() {
        // 1) 알럿 바탕
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 2) 버튼 구성
        let korean = UIAlertAction(title: "한식", style: .default) { [self] _ in
            filterdRestaurant = restaurants.filter { $0.category == "한식" }
            showAnnotation(restaurants: filterdRestaurant)
        }
        
        let japanese = UIAlertAction(title: "일식", style: .default) { [self] _ in
            filterdRestaurant = restaurants.filter { $0.category == "일식" }
            showAnnotation(restaurants: filterdRestaurant)
        }
        
        let bunsik = UIAlertAction(title: "분식", style: .default) { [self] _ in
            filterdRestaurant = restaurants.filter { $0.category == "분식" }
            showAnnotation(restaurants: filterdRestaurant)
        }
        
        let all = UIAlertAction(title: "모두보기", style: .default) { [self] _ in
            filterdRestaurant = restaurants
            showAnnotation(restaurants: filterdRestaurant)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        // 3) 알럿에 버튼 추가
        alert.addAction(korean)
        alert.addAction(japanese)
        alert.addAction(bunsik)
        alert.addAction(all)
        alert.addAction(cancel)
        
        
        // 4) 알럿 표시하기
        present(alert, animated: true)
    }
    
    // 맵 마커 표시 로직 메서드
    func showAnnotation(restaurants: [Restaurant]) {
        restaurantMapView.removeAnnotations(restaurantMapView.annotations)
        var annotations: [MKAnnotation] = []
        
        for restaurant in restaurants {
            let center = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = center
            annotation.title = "\(restaurant.name)"
            
            annotations.append(annotation)
        }
        
        restaurantMapView.addAnnotations(annotations)
    }

}
