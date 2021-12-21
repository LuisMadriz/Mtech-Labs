
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    // add item controller property
    //1
    var storeItemController = StoreItemController()
    
    var items = [StoreItem]()
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            
            // set up query dictionary
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items and reload the table view
            // otherwise, print an error to the console
            
            /*let query = [
                "term": "Apple",
                "media": "ebook",
                "lang": "en_us"
            ]
            */
             let query = [
             "term": searchTerm,
             "media": mediaType,
             "lang": "en_us",
             "limit": "20"
             ] as [String : String]
            
// paso nuevo
        storeItemController.fetchItems(matching: query) { (Result)  in
            switch Result {
            case.success(let items):
                self.items = items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                    print(error)
            }
                
            }
            
        }
    }
    
    func configure(cell: ItemCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        cell.titleLabel.text = item.name
        
        cell.detailLabel.text = item.artist
        
        cell.itemImageView.image = UIImage(systemName: "photo")
        
        let artworkRequest = URLRequest(url: item.artworkURL)
        URLSession.shared.dataTask(with: artworkRequest) {
            (data, response, error) in
            
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async() {
                cell.itemImageView.image = UIImage(data: data)
            }
        }.resume()
        
        // initialize a network task to fetch the item's artwork
        
        // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the
    }
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as! ItemCell
        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}

