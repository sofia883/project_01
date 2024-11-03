import 'package:flutter/material.dart';
import 'package:project_01/services/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final Color _primaryColor = Color(0xFFFFD700);
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final displayedCategories = CategoryUtils.categories.take(7).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        backgroundColor: _primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle showing all items
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'All Items',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _selectedCategory,
                hint: Text('Select Category'),
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down, color: _primaryColor),
                underline: SizedBox(), // Remove the default underline
                items: CategoryUtils.categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.name,
                    child: Row(
                      children: [
                        Icon(
                          category.icon ?? Icons.category,
                          color: _primaryColor,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(category.name ?? 'Category'),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: displayedCategories.length,
                itemBuilder: (context, index) {
                  final category = displayedCategories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category.icon ?? Icons.category,
                          size: 32,
                          color: _primaryColor,
                        ),
                        SizedBox(height: 8),
                        Text(
                          category.name ?? 'Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: _primaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add Item',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            // Add navigation logic here
            if (index == 3) {
              // Navigate to user profile screen
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          },
        ),
      ),
    );
  }
}
