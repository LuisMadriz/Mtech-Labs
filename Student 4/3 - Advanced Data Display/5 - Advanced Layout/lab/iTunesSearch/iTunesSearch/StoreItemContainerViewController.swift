
import UIKit

class StoreItemContainerViewController: UIViewController, UISearchResultsUpdating {
    
    @IBOutlet var tableContainerView: UIView!
    @IBOutlet var collectionContainerView: UIView!
    
    let searchController = UISearchController()
    let storeItemController = StoreItemController()
    
    //step 6
    weak var collectionViewController:
        StoreItemCollectionViewController?
    //step 2
    var tableViewDataSource: UITableViewDiffableDataSource<String, StoreItem>!
    var collectionViewDataSource: UICollectionViewDiffableDataSource<String, StoreItem>!
    
//    var items = [StoreItem]()
    var snapshot = NSDiffableDataSourceSnapshot<String, StoreItem>()
        
    var selectedSearchScope: SearchScope {
        let selectedIndex = searchController.searchBar.selectedScopeButtonIndex
        let searchScope = SearchScope.allCases[selectedIndex]
        
        return searchScope
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.automaticallyShowsSearchResultsController = true
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.scopeButtonTitles = SearchScope.allCases.map { $0.title }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableViewController = segue.destination as? StoreItemListTableViewController {
            configureTableViewDataSource(tableViewController.tableView)
        }
        
        if let collectionViewController = segue.destination as?
            StoreItemCollectionViewController {
            self.collectionViewController = collectionViewController
            collectionViewController.configureCollectionViewLayout(for: selectedSearchScope)
            configureCollectionViewDataSource(collectionViewController.collectionView)
        }
        
    }
    
    func configureTableViewDataSource(_ tableView: UITableView) {
        tableViewDataSource = StoreItemTableViewDiffableDataSource(tableView: tableView, storeItemController: storeItemController)
    }
    //step 5
    func configureCollectionViewDataSource(_ collectionView: UICollectionView) {
        collectionViewDataSource = .init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as! ItemCollectionViewCell
            cell.configure(for: item, storeItemController: self.storeItemController)
            
            
            
            self.collectionViewDataSource.supplementaryViewProvider =
            { collectionView, kind, indexPath -> UICollectionReusableView? in
                
                let headerView =
                collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: StoreItemCollectionViewSectionHeader.reuseIdentifier, for: indexPath) as! StoreItemCollectionViewSectionHeader
                
                let title =
                self.snapshot.sectionIdentifiers[indexPath.section]
                headerView.setTitle(title)
                
                return headerView
                
            }
            
            return cell
        })
        
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchMatchingItems), object: nil)
        perform(#selector(fetchMatchingItems), with: nil, afterDelay: 0.3)
    }
    //new fuction step 2
   
    func handleFetchedItems(_ items: [StoreItem]) {
        
            let currentSnapshotItems = snapshot.itemIdentifiers
            let updatedSnapshot = createSectionedSnapshot(from: currentSnapshotItems + items)
            snapshot = updatedSnapshot
            //itemsSnapshot = createSectionedSnapshot(from:
            //currentSnapshotItems + items)
        
            tableViewDataSource.apply(snapshot,
               animatingDifferences: true, completion: nil)
            collectionViewDataSource.apply(snapshot,
               animatingDifferences: true, completion: nil)
        }

                
    @IBAction func switchContainerView(_ sender: UISegmentedControl) {
        tableContainerView.isHidden.toggle()
        collectionContainerView.isHidden.toggle()
    }
    
    @objc func fetchMatchingItems() {
        
        snapshot.deleteAllItems()
        
        // apply data source changes
        tableViewDataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        collectionViewDataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        
        let searchTerm = searchController.searchBar.text ?? ""
        let mediaType = selectedSearchScope.mediaType
        
        if !searchTerm.isEmpty {
            
            
            let searchScopes: [SearchScope]
            if selectedSearchScope == .all {
                searchScopes = [.movies, .music, .apps, .books]
            } else {
                searchScopes = [selectedSearchScope]
            }
            
            for searchScope in searchScopes {
                let query = [
                    "term": searchTerm,
                    "media": searchScope.mediaType,
                    "lang": "en_us",
                    "limit": "20"
                ]
                
                storeItemController.fetchItems(matching: query) { (result) in
                    switch result {
                    case .success(let items):
                        DispatchQueue.main.async {
                            guard searchTerm ==
                                    self.searchController.searchBar.text else {
                                return
                            }
                            self.handleFetchedItems(items)
                            self.tableViewDataSource.apply(self.snapshot, animatingDifferences: true, completion: nil)
                        }
                    case .failure(let error):
                        print(error)
                    }
                    
                    
                }
            }
            
        }
    }
    
    func createSectionedSnapshot(from items: [StoreItem]) ->
       NSDiffableDataSourceSnapshot<String, StoreItem> {
    
        let movies = items.filter { $0.kind == "feature-movie" }
        let music = items.filter { $0.kind == "song" || $0.kind == "album" }
        let apps = items.filter { $0.kind == "software" }
        let books = items.filter { $0.kind == "ebook" }
    
        let grouped: [(SearchScope, [StoreItem])] = [
            (.movies, movies),
            (.music, music),
            (.apps, apps),
            (.books, books)
        ]
    
        var snapshot = NSDiffableDataSourceSnapshot<String, StoreItem>()
        grouped.forEach { (scope, items) in
            if items.count > 0 {
                snapshot.appendSections([scope.title])
                snapshot.appendItems(items, toSection: scope.title)
            }
        }
    
        return snapshot
    }

}
