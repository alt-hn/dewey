# Homepage Refactoring Manifest

## ✅ Completed Tasks

### 1. Directory Structure
Created: `public/home/`
- `images/slider/` - Hero slider images (14 files: 7 mobile + 7 desktop)
- `images/logos/` - Brand logos (6 files: Dewey, Sakura, CIS, AP, IB, Mount Vernon)
- `images/features/` - Feature icons (10 files)
- `images/campuses/` - Campus photos (4 files)
- `images/programs/` - Program banners (3 files)
- `images/infographics/` - Statistics graphics (3 files)
- `css/` - Stylesheet files (18 files)
- `scripts/` - JavaScript files (4 files)

### 2. Assets Downloaded
**Images: 44 files (~3.8 MB)**
- Slider: tuyen-sinh-lop1-mobile.jpg, tuyen-sinh-lop1-desktop.jpg, etc.
- Logos: dewey-logo.svg, sakura-logo.png, cis-member.png, logo-ap.png, ib-logo.png, mount-vernon.png
- Features: 7-mon-hoc.png, design-thinking.png, ca-nhan-hoa.png, du-hoc-my.png, etc.
- Campuses: cau-giay.webp, hai-phong.webp, tay-ho-tay.webp, ocean-park.webp
- Programs: explore.png, discover.png, adventure.png
- Infographics: gioi-thieu.webp, con-so-mobile.jpg, trang-chu-mobile.jpg

**CSS: 18 files (~523 KB)**
- dewey-theme.css, dewey-theme.min.css
- elementor-frontend.min.css, elementor-post-6.css
- widget-*.min.css (image, heading, divider, text-editor, social-icons, icon-list, nav-menu)
- animation-*.min.css (grow, fadeIn)
- swiper.min.css
- fluent-forms.css, fluent-forms-default.css
- language-switcher.min.css
- font-awesome.min.css

**JavaScript: 4 files (~274 KB)**
- hello-frontend.min.js
- html5lightbox.js
- fluent-form-submission.js
- swiper.min.js

### 3. Components Created
**✅ src/components/sections/home/**
- `HomeNavbar.astro` (173 lines) - Navigation header with logo, menus, language switcher
- `HomeHeroSlider.astro` (154 lines) - 7-slide hero banner carousel
- `HomeCertificationBadges.astro` (119 lines) - CIS, AP, IB, Mount Vernon badges
- `HomeAboutSection.astro` (13 lines) - TDS introduction image (desktop only)
- `HomeFeaturesGrid.astro` (373 lines) - Statistics grid + 12 feature cards
- `HomeStatisticsInfographic.astro` (28 lines) - Mobile infographic section
- `HomeCampusSlider.astro` (70 lines) - 4 campus locations slider
- `HomeProgramCards.astro` (120 lines) - 4 education program cards

**⏳ Pending Creation:**
- `HomeFooter.astro` - Full footer section (FooterSection.astro, 3254 lines)

## 📝 Asset Path Mapping Reference

### URL Patterns
```
OLD: https://thedeweyschools.edu.vn/wp-content/uploads/[path]
NEW: /home/images/[category]/[filename]
```

### Specific Mappings
```javascript
// Logos
"2023/01/vp_vp-logo-dewey-02-1.svg" → "/home/images/logos/dewey-logo.svg"
"2023/02/logo-sakura-schools01.png" → "/home/images/logos/sakura-logo.png"
"2023/03/cis-schools-member-1.png" → "/home/images/logos/cis-member.png"
"2023/07/Logo-AP.png" → "/home/images/logos/logo-ap.png"
"2024/05/ib-logo.png" → "/home/images/logos/ib-logo.png"
"2023/07/Logo-The-Mount-Vernon-School.png" → "/home/images/logos/mount-vernon.png"

// Slider Images (Desktop)
"2025/09/tuyen-sinh-lop1-website.jpg" → "/home/images/slider/tuyen-sinh-lop1-desktop.jpg"
"2025/10/hoc-bong-mastery-2526-website.jpg" → "/home/images/slider/hoc-bong-mastery-desktop.jpg"
"2025/11/cg-mastery-web.jpg" → "/home/images/slider/cg-mastery-desktop.jpg"
"2025/09/tuyen-sinh-5-12-26-27-website.jpg" → "/home/images/slider/tuyen-sinh-5-12-desktop.jpg"
"2025/09/tuyen-sinh-lop6-26-27-website.jpg" → "/home/images/slider/tuyen-sinh-lop6-desktop.jpg"
"2025/09/tuyen-sinh-lop-10-website.jpg" → "/home/images/slider/tuyen-sinh-lop10-desktop.jpg"
"2025/09/tuyen-sinh-bo-sung-26-27-website.jpg" → "/home/images/slider/tuyen-sinh-bosung-desktop.jpg"

// Slider Images (Mobile - background-image)
"2025/09/tuyen-sinh-lop1-mobile.jpg" → "/home/images/slider/tuyen-sinh-lop1-mobile.jpg"
"2025/10/hoc-bong-mastery-2526-mobile.jpg" → "/home/images/slider/hoc-bong-mastery-mobile.jpg"
// ... (same pattern)

// Feature Icons (Elementor thumbs)
"elementor/thumbs/7-mon-hoc-*.png" → "/home/images/features/7-mon-hoc.png"
"elementor/thumbs/Design-Thinking-*.png" → "/home/images/features/design-thinking.png"
"elementor/thumbs/Ca-nhan-hoa-*.png" → "/home/images/features/ca-nhan-hoa.png"
"elementor/thumbs/du-hoc-My-*.png" → "/home/images/features/du-hoc-my.png"
"elementor/thumbs/Moi-truong-quoc-te-*.png" → "/home/images/features/moi-truong-quoc-te.png"
"elementor/thumbs/ren-luyen-kha-nang-*.png" → "/home/images/features/ren-luyen-kha-nang.png"
"elementor/thumbs/Phat-trien-nang-khieu-*.png" → "/home/images/features/phat-trien-nang-khieu.png"
"elementor/thumbs/Hoi-dong-Kh-SP-*.png" → "/home/images/features/hoi-dong-kh-sp.png"
"elementor/thumbs/cis-logo-01-*.png" → "/home/images/features/cis-logo.png"
"elementor/thumbs/Mount-Vernon-School-*.png" → "/home/images/features/mount-vernon-feature.png"

// Campuses
"2023/03/Group-264.webp" → "/home/images/campuses/cau-giay.webp"
"2023/03/Group-267.webp" → "/home/images/campuses/hai-phong.webp"
"2023/03/Group-266.webp" → "/home/images/campuses/tay-ho-tay.webp"
"2023/03/Group-265.webp" → "/home/images/campuses/ocean-park.webp"

// Programs
"2023/06/chuongtrinhtichhopexplore.png" → "/home/images/programs/explore.png"
"2023/10/chuong-trinh-tich-hop-discover.png" → "/home/images/programs/discover.png"
"2023/10/chuong-trinh-quoc-te-adventure.png" → "/home/images/programs/adventure.png"

// Infographics
"2023/03/gt.webp" → "/home/images/infographics/gioi-thieu.webp"
"2025/05/Con-so-biet-noi-mobile-458x600.jpg" → "/home/images/infographics/con-so-mobile.jpg"
"2025/05/trang-chu-mobile-1-scaled.jpg" → "/home/images/infographics/trang-chu-mobile.jpg"
```

## 🛠️ Scripts Created
- `scripts/download-assets.ps1` - Download all images
- `scripts/download-css-js.ps1` - Download CSS and JavaScript files

## 📊 Original File Sizes
- `HeaderSection.astro`: 129 lines → `HomeNavbar.astro`: 173 lines
- `MainSection.astro`: 1710 lines → 7 smaller sections (pending)
- `FooterSection.astro`: 3254 lines → `HomeFooter.astro` (pending)
- `FooterAssets.astro`: 188 lines (CSS/JS includes - reference only)
- `PageHead.astro`: 205 lines (meta tags - reference only)

## 🎯 Next Steps
1. Create remaining 7 sections from MainSection.astro
2. Create HomeFooter.astro from FooterSection.astro
3. Update all asset paths in pending sections
4. Create homepage assembly file using all sections
5. Test local asset loading
6. Update storybook.astro to reference new sections
7. Remove old monolithic components

## 📋 Usage Example
```astro
---
// src/pages/index.astro
import HomeNavbar from '../components/sections/home/HomeNavbar.astro';
import HomeHeroSlider from '../components/sections/home/HomeHeroSlider.astro';
import HomeCertificationBadges from '../components/sections/home/HomeCertificationBadges.astro';
// ... import other sections
import HomeFooter from '../components/sections/home/HomeFooter.astro';
---

<HomeNavbar />
<main>
  <HomeHeroSlider />
  <HomeCertificationBadges />
  <HomeAboutSection />
  <HomeFeaturesGrid />
  <HomeStatisticsInfographic />
  <HomeCampusSlider />
  <HomeProgramCards />
</main>
<HomeFooter />
```

## ⚠️ Important Notes
- All Elementor classes preserved for styling compatibility
- Swiper.js required for sliders (downloaded to /home/scripts/)
- Font Awesome CSS needed for icons (downloaded)
- External links to tuyensinh.thedeweyschools.edu.vn kept as-is
- Popup triggers (#elementor-action) preserved
- Language switcher SVG embedded (no external file)

## 🔗 Dependencies
**CSS Load Order:**
1. dewey-theme.min.css
2. elementor-frontend.min.css
3. widget-*.min.css
4. swiper.min.css
5. animation-*.min.css

**JS Load Order:**
1. swiper.min.js (for sliders)
2. hello-frontend.min.js (theme scripts)
3. html5lightbox.js (for popups)
4. fluent-form-submission.js (for forms)
