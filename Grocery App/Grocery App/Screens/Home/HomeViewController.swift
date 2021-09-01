//
//  HomeViewController.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit

class HomeViewController: BaseViewController {

    
    //MARK: - IBOutlets
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var headerNameLabel: UILabel!
    @IBOutlet private weak var headerProfileImageView: UIImageView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var mainVStackView: UIStackView!
    
    
    //MARK: - Components
    var recentShopView: RecentShopView?
    
    
    //MARK: - Private Properties
    lazy var fruitCategory: ProductCategory = ProductCategory(id: 1, name: "Fruit")
    lazy var vegetableCategory: ProductCategory = ProductCategory(id: 2, name: "Vegetable")
    
    lazy var products: [Product] = [
        Product(name: "Orange", category: fruitCategory, price: 14.99, rate: 4.4, image: "imgOrange", color: "#FFA801", description: "The orange is the fruit of various citrus species in the family Rutaceae primarily refers to sinensis, which is also called sweet orange, to distinguish it from the related aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations.\n\nThe orange is a hybrid between pomelo (Citrus maxima) and mandarin (Citrus reticulata). The chloroplast genome, and therefore the maternal line, is that of pomelo. The sweet orange has had its full genome sequenced.\n\nThe orange originated in a region encompassing Southern China, Northeast India, and Myanmar, and the earliest mention of the sweet orange was in Chinese literature in 314 BC. As of 1987, orange trees were found to be the most cultivated fruit tree in the world.[10] Orange trees are widely grown in tropical and subtropical climates for their sweet fruit. The fruit of the orange tree can be eaten fresh, or processed for its juice or fragrant peel. As of 2012, sweet oranges accounted for approximately 70% of citrus production.\n\nIn 2019, 79 million tonnes of oranges were grown worldwide, with Brazil producing 22% of the total, followed by China and India."),
        Product(name: "Broccoli", category: vegetableCategory, price: 12.99, rate: 4.4, image: "imgBroccoli", color: "#1C1C18", description: "Broccoli is an edible green plant in the cabbage family whose large flowering head, stalk and small associated leaves are eaten as a vegetable. Broccoli is classified in the Italica cultivar group of the species Brassica oleracea. Broccoli has large flower heads, usually dark green, arranged in a tree-like structure branching out from a thick stalk which is usually light green. The mass of flower heads is surrounded by leaves. Broccoli resembles cauliflower, which is a different, but closely related cultivar group of the same Brassica species.\n\nIt is eaten either raw or cooked. Broccoli is a particularly rich source of vitamin C and vitamin K. Contents of its characteristic sulfur-containing glucosinolate compounds, isothiocyanates and sulforaphane, are diminished by boiling, but are better preserved by steaming, microwaving or stir-frying."),
        Product(name: "Brussels", category: vegetableCategory, price: 12.99, rate: 4.4, image: "imgBrussels", color: "#373D1F", description: "The Brussels sprout is a member of the Gemmifera Group of cabbages, grown for its edible buds. The leaf vegetables are typically 1.5–4.0 cm (0.6–1.6 in) in diameter and resemble miniature cabbages. The Brussels sprout has long been popular in Brussels, Belgium, from which it gained its name."),
        Product(name: "Carrots", category: vegetableCategory, price: 8.99, rate: 4.4, image: "imgCarrots", color: "#B54B25", description: "The carrot is a root vegetable, typically orange in color, though purple, black, red, white, and yellow cultivars exist, all of which are domesticated forms of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds. The most commonly eaten part of the plant is the taproot, although the stems and leaves are also eaten. The domestic carrot has been selectively bred for its greatly enlarged, more palatable, less woody-textured taproot.\n\nThe carrot is a biennial plant in the umbellifer family, Apiaceae. At first, it grows a rosette of leaves while building up the enlarged taproot. Fast-growing cultivars mature within three months (90 days) of sowing the seed, while slower-maturing cultivars need a month longer (120 days). The roots contain high quantities of alpha- and beta-carotene, and are a good source of vitamin K and vitamin B6.\n\nThe United Nations Food and Agriculture Organization (FAO) reports that world production of carrots and turnips (these plants are combined by the FAO) for 2018 was 40 million tonnes, with 45% of the world total grown in China. Carrots are widely used in many cuisines, especially in the preparation of salads, and carrot salads are a tradition in many regional cuisines."),
        Product(name: "Cauliflower", category: vegetableCategory, price: 8.99, rate: 4.4, image: "imgCauliflower", color: "#FAF6DA", description: "Cauliflower is one of several vegetables in the species Brassica oleracea in the genus Brassica, which is in the Brassicaceae (or Mustard) family. It is an annual plant that reproduces by seed. Typically, only the head is eaten – the edible white flesh sometimes called \"curd\" (with a similar appearance to cheese curd). The cauliflower head is composed of a white inflorescence meristem. Cauliflower heads resemble those in broccoli, which differs in having flower buds as the edible portion. Brassica oleracea also includes broccoli, Brussels sprouts, cabbage, collard greens, and kale, collectively called \"cole\" crops, though they are of different cultivar groups."),
        Product(name: "Lettuce", category: vegetableCategory, price: 8.99, rate: 4.4, image: "imgLettuce", color: "#DCE4AC", description: "Lettuce (Lactuca sativa) is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.[3] One variety, the celtuce (asparagus lettuce), is grown for its stems, which are eaten either raw or cooked. In addition to its main use as a leafy green, it has also gathered religious and medicinal significance over centuries of human consumption. Europe and North America originally dominated the market for lettuce, but by the late 20th century the consumption of lettuce had spread throughout the world. World production of lettuce and chicory for 2017 was 27 million tonnes, 56% of which came from China.\n\nLettuce was originally farmed by the ancient Egyptians, who transformed it from a plant whose seeds were used to create oil into an important food crop raised for its succulent leaves and oil-rich seeds. Lettuce spread to the Greeks and Romans; the latter gave it the name lactuca, from which the English lettuce is derived. By 50 AD, many types were described, and lettuce appeared often in medieval writings, including several herbals. The 16th through 18th centuries saw the development of many varieties in Europe, and by the mid-18th century cultivars were described that can still be found in gardens.\n\nGenerally grown as a hardy annual, lettuce is easily cultivated, although it requires relatively low temperatures to prevent it from flowering quickly. It can be plagued by numerous nutrient deficiencies, as well as insect and mammal pests, and fungal and bacterial diseases. L. sativa crosses easily within the species and with some other species within the genus Lactuca. Although this trait can be a problem to home gardeners who attempt to save seeds, biologists have used it to broaden the gene pool of cultivated lettuce varieties.\n\nLettuce is a rich source of vitamin K and vitamin A, and a moderate source of folate and iron. Contaminated lettuce is often a source of bacterial, viral, and parasitic outbreaks in humans, including E. coli and Salmonella."),
        Product(name: "Potatoes", category: vegetableCategory, price: 8.99, rate: 4.4, image: "imgPotatoes", color: "#E4BC68", description: "The potato is a starchy tuber of the plant Solanum tuberosum and is a root vegetable native to the Americas, with the plant itself being a perennial in the nightshade family Solanaceae.\n\nWild potato species, originating in modern-day Peru, can be found throughout the Americas, from Canada to southern Chile. The potato was originally believed to have been domesticated by Native Americans independently in multiple locations, but later genetic testing of the wide variety of cultivars and wild species traced a single origin for potatoes, in the area of present-day southern Peru and extreme northwestern Bolivia. Potatoes were domesticated approximately 7,000–10,000 years ago there, from a species in the Solanum brevicaule complex. In the Andes region of South America, where the species is indigenous, some close relatives of the potato are cultivated.\n\nPotatoes were introduced to Europe from the Americas in the second half of the 16th century by the Spanish. Today they are a staple food in many parts of the world and an integral part of much of the world's food supply. As of 2014, potatoes were the world's fourth-largest food crop after maize (corn), wheat, and rice. Following millennia of selective breeding, there are now over 5,000 different types of potatoes. Over 99% of presently cultivated potatoes worldwide descended from varieties that originated in the lowlands of south-central Chile. The importance of the potato as a food source and culinary ingredient varies by region and is still changing. It remains an essential crop in Europe, especially Northern and Eastern Europe, where per capita production is still the highest in the world, while the most rapid expansion in production over the past few decades has occurred in southern and eastern Asia, with China and India leading the world in overall production as of 2018.\n\nLike the tomato, the potato is a nightshade in the genus Solanum, and the vegetative and fruiting parts of the potato contain the toxin solanine which is dangerous for human consumption. Normal potato tubers that have been grown and stored properly produce glycoalkaloids in amounts small enough to be negligible to human health, but if green sections of the plant (namely sprouts and skins) are exposed to light, the tuber can accumulate a high enough concentration of glycoalkaloids to affect human health."),
        Product(name: "Spinach", category: vegetableCategory, price: 8.99, rate: 4.4, image: "imgSpinach", color: "#5F8747", description: "Spinach is a leafy green flowering plant native to central and western Asia. It is of the order Caryophyllales, family Amaranthaceae, subfamily Chenopodioideae. Its leaves are a common edible vegetable consumed either fresh, or after storage using preservation techniques by canning, freezing, or dehydration. It may be eaten cooked or raw, and the taste differs considerably; the high oxalate content may be reduced by steaming.\n\nIt is an annual plant (rarely biennial), growing as tall as 30 cm (1 ft). Spinach may overwinter in temperate regions. The leaves are alternate, simple, ovate to triangular, and very variable in size: 2–30 cm (1–12 in) long and 1–15 cm (0.4–5.9 in) broad, with larger leaves at the base of the plant and small leaves higher on the flowering stem. The flowers are inconspicuous, yellow-green, 3–4 mm (0.1–0.2 in) in diameter, and mature into a small, hard, dry, lumpy fruit cluster 5–10 mm (0.2–0.4 in) across containing several seeds.\n\nIn 2018, world production of spinach was 26.3 million tonnes, with China alone accounting for 90% of the total.")
    ]
    
    //MARK: - Public Properties
    //MARK: - Constructors
    //MARK: - Initialization
    class func createModule() -> HomeViewController {
        let controller = HomeViewController()
        return controller
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    override func firstViewWillAppear() {
        super.firstViewWillAppear()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let vc = GetStartedViewController()
        present(vc, animated: true, completion: nil)
    }
    
    
    //MARK: - Setup
    private func setup() {
        setupHeader()
        setupSearch()
        setupCategories()
        setupProducts()
        setupRecentShop()
    }
    
    
    private func setupHeader() {
        headerTitleLabel.font = UIFont.custom(.bold).withSize(16)
        headerTitleLabel.textColor = UIColor.mainLabelSec
        
        headerNameLabel.font = UIFont.custom(.bold).withSize(28)
        headerNameLabel.textColor = UIColor.mainLabel
        
        headerProfileImageView.layer.cornerRadius = 8
    }
    
    
    private func setupSearch() {
        //searchBar.delegate = self
        searchBar.setFieldColor(UIColor.mainBackground)
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    
    
    private func setupCategories() {
        let categoriesView = CategoriesFilterView.createModule()
        mainVStackView.addArrangedSubview(categoriesView)
        categoriesView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    private func setupProducts() {
        let productsView = ProductsView.createModule(dataSource: self, delegate: self)
        mainVStackView.addArrangedSubview(productsView)
        productsView.heightAnchor.constraint(equalToConstant: 275).isActive = true
        
        let blankView = UIView()
        mainVStackView.addArrangedSubview(blankView)
    }
    
    
    private func setupRecentShop() {
        let container = UIView()
        recentShopView = RecentShopView.createModule()
        container.addSubview(recentShopView!)
        recentShopView?.setAnchors([
            .top(to: container.topAnchor),
            .bottom(to: container.bottomAnchor),
            .leading(to: container.leadingAnchor, constant: 30),
            .trailing(to: container.trailingAnchor, constant: -30)
        ])
        
        mainVStackView.addArrangedSubview(container)
    }
    
    //MARK: - Actions
    //MARK: - Configuration
    //MARK: - Delegate


}


extension HomeViewController: ProductsViewDataSource {
    
    func productsView(_ productsView: ProductsView) -> Int {
        return products.count
    }
    
    func productsView(_ productsView: ProductsView, productForItemAt indexPath: IndexPath) -> Product {
        let product = products[indexPath.row]
        return product
    }
    
}


extension HomeViewController: ProductsViewDelegate {
    
    func didSelectedProduct(product: Product) {
        let vc = ProductViewController.createModule(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
