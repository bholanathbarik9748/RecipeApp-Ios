https://github.com/user-attachments/assets/c70741dd-1e37-4604-959d-a5469d2d9445
<body>
    <h1>CookCraft - RecipeApp</h1>
    <p>CookCraft is an iOS application designed to help users discover, save, and create delicious recipes. The app utilizes the MealDB API to fetch a wide variety of recipes, and Core Data is used to store user-selected recipes as well as custom recipes created by the user. The app also integrates YouTube deeplinks for users to watch recipe-related videos directly.</p>
    <h2>Features</h2>
    <ul>
        <li><strong>Explore Recipes</strong>: Browse and search recipes from the MealDB API using <code>URLSession</code> for API calls.</li>
        <li><strong>Save Favorite Recipes</strong>: Save recipes locally using Core Data for offline access.</li>
        <li><strong>Create and Store Custom Recipes</strong>: Users can create their own recipes and store them within the app.</li>
        <li><strong>YouTube Deeplink Integration</strong>: Watch video tutorials for recipes on YouTube directly through the app.</li>
    </ul>
    <h2>Installation</h2>
    <h3>Prerequisites</h3>
    <ul>
        <li>macOS with Xcode installed.</li>
        <li>An iOS device or simulator running iOS 14.0 or later.</li>
    </ul>
    <h3>Setup</h3>
    <ol>
        <li>Clone the repository:
            <pre><code>git clone https://github.com/bholanathbarik9748/RecipeApp-Ios.git</code></pre>
        </li>
        <li>Open the project in Xcode:
            <pre><code>cd RecipeApp
open RecipeApp.xcodeproj</code></pre>
        </li>
        <li>Build and run the app on your desired iOS device or simulator.</li>
    </ol>
    <h2>Usage</h2>
    <h3>Fetching Recipes</h3>
    <p>The app pulls recipe data from the MealDB API and displays it in a user-friendly list. Users can search for recipes by name or filter them by category.</p>
    <h3>Saving Recipes</h3>
    <p>Users can save their favorite recipes by tapping the save button, allowing for offline access via Core Data.</p>
    <h3>Creating Custom Recipes</h3>
    <p>Users can create their own recipes and store them in the app using Core Data.</p>
    <h3>Watching Recipe Videos</h3>
    <p>Users can watch recipe videos via deeplinks to YouTube, making it easy to follow along with video tutorials.</p>
    <h2>Core Data Integration</h2>
    <p>The app’s data model includes:</p>
    <ul>
        <li><strong>SavedRecipe</strong>: Stores recipes fetched from the MealDB API that the user has chosen to save.</li>
        <li><strong>UserRecipe</strong>: Stores user-created recipes.</li>
    </ul>
    <h2>API Integration</h2>
    <h3>MealDB API</h3>
    <p>The app fetches recipe data from the MealDB API, offering endpoints for searching by name and filtering by category.</p>
    <h3>YouTube Deeplinks</h3>
    <p>The app integrates YouTube deeplinks, allowing users to watch related video content directly.</p>
    <h2>Roadmap</h2>
    <ul>
        <li><strong>Add Category Filters</strong>: Improve search functionality with more detailed filtering options.</li>
        <li><strong>Enhance UI/UX</strong>: Refine the design and add more interactive elements.</li>
        <li><strong>Push Notifications</strong>: Notify users when new recipes are available.</li>
        <li><strong>Social Sharing</strong>: Allow users to share recipes via social media platforms.</li>
    </ul>
    <h2>Contributing</h2>
    <p>Contributions are welcome! Feel free to fork the repository, make your changes, and submit a pull request. Please ensure your code follows the coding standards and includes relevant tests.</p>
    <h2>License</h2>
    <p>This project is licensed under the MIT License. See the <a href="LICENSE">LICENSE</a> file for more information.</p>
    <h2>Contact</h2>
    <p>For questions, feedback, or collaboration opportunities, you can reach out via:</p>
    <ul>
        <li><strong>Email</strong>: <a href="mailto:bholanathbarik9748@gmail.com">bholanathbarik9748@gmail.com</a></li>
        <li><strong>GitHub</strong>: <a href="https://github.com/bholanathbarik9748">bholanathbarik9748</a></li>
    </ul>
</body>
</html>
