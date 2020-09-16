## see https://revealjs.com/upgrading/ for details
-----

-updated reveal.js to use newest markups and scripts

-merged reveal.js latests changes with presentations dir
	-CONFLICT (content): Merge conflict in package-lock.json
	-CONFLICT (content): Merge conflict in index.html
	-CONFLICT (content): Merge conflict in README.md

	del package-lock.json
	add index.html and README.md to .gitignore

- recompiled node components in presentations dir
- cleaned up the scripts and css used by reveal.js (v3 to v4) in the presentation html file for "recipe" presentation
	- 
- added !important to each presentation .css background image classes (start of file)
- converted the following presentation from reveal v3 to v4
	- AgileBirdsEye.html
	- BigRoomPlanningAUG.html
	- BigRoomPlanningBAM.html
	- DevOpsBirdsEye.html
	- GaryMontiInterview.html
	- HowToWriteARecipeForAutomatedTesting.html
	- Internship.html
	- JiraXray.html
	- ScrumMasterInterviewGames.html