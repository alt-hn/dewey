# Download essential CSS and JavaScript files for homepage
# Run: .\scripts\download-css-js.ps1

$baseUrl = "https://thedeweyschools.edu.vn"
$cssDir = "public/home/css"
$jsDir = "public/home/scripts"

Write-Host "Downloading CSS and JavaScript files..." -ForegroundColor Cyan

function Download-Asset {
    param([string]$Url, [string]$OutputPath)
    
    try {
        $fileName = Split-Path $OutputPath -Leaf
        Write-Host "  Downloading: $fileName" -ForegroundColor Yellow
        
        Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UseBasicParsing -ErrorAction Stop
        
        $fileSize = (Get-Item $OutputPath).Length
        $sizeKB = [math]::Round($fileSize/1KB, 2)
        Write-Host "  OK: $fileName ($sizeKB KB)" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "  FAILED: $fileName - $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Critical CSS files
Write-Host "`n=== DOWNLOADING CSS ===" -ForegroundColor Cyan

$cssFiles = @{
    # Theme styles
    "wp-content/themes/dewey-5/style.css" = "$cssDir/dewey-theme.css"
    "wp-content/themes/dewey-5/theme.min.css" = "$cssDir/dewey-theme.min.css"
    
    # Elementor core CSS
    "wp-content/uploads/elementor/css/custom-frontend.min.css" = "$cssDir/elementor-frontend.min.css"
    "wp-content/uploads/elementor/css/post-6.css" = "$cssDir/elementor-post-6.css"
    
    # Elementor widgets
    "wp-content/plugins/elementor/assets/css/widget-image.min.css" = "$cssDir/widget-image.min.css"
    "wp-content/plugins/elementor/assets/css/widget-heading.min.css" = "$cssDir/widget-heading.min.css"
    "wp-content/plugins/elementor/assets/css/widget-divider.min.css" = "$cssDir/widget-divider.min.css"
    "wp-content/plugins/elementor/assets/css/widget-text-editor.min.css" = "$cssDir/widget-text-editor.min.css"
    "wp-content/plugins/elementor/assets/css/widget-social-icons.min.css" = "$cssDir/widget-social-icons.min.css"
    "wp-content/uploads/elementor/css/custom-widget-icon-list.min.css" = "$cssDir/widget-icon-list.min.css"
    "wp-content/uploads/elementor/css/custom-pro-widget-nav-menu.min.css" = "$cssDir/widget-nav-menu.min.css"
    
    # Animations
    "wp-content/plugins/elementor/assets/lib/animations/styles/e-animation-grow.min.css" = "$cssDir/animation-grow.min.css"
    "wp-content/plugins/elementor/assets/lib/animations/styles/fadeIn.min.css" = "$cssDir/animation-fadeIn.min.css"
    
    # Swiper slider
    "wp-content/plugins/elementor/assets/lib/swiper/v8/css/swiper.min.css" = "$cssDir/swiper.min.css"
    
    # FluentForm
    "wp-content/plugins/fluentform/assets/css/fluent-forms-public.css" = "$cssDir/fluent-forms.css"
    "wp-content/plugins/fluentform/assets/css/fluentform-public-default.css" = "$cssDir/fluent-forms-default.css"
    
    # Language switcher
    "wp-content/plugins/connect-polylang-elementor/assets/css/language-switcher.min.css" = "$cssDir/language-switcher.min.css"
    
    # Font Awesome icons
    "wp-content/plugins/elementor/assets/lib/font-awesome/css/all.min.css" = "$cssDir/font-awesome.min.css"
}

foreach ($file in $cssFiles.GetEnumerator()) {
    $url = "$baseUrl/$($file.Key)"
    $output = $file.Value
    Download-Asset -Url $url -OutputPath $output
}

# Critical JavaScript files
Write-Host "`n=== DOWNLOADING JAVASCRIPT ===" -ForegroundColor Cyan

$jsFiles = @{
    # Theme scripts
    "wp-content/themes/dewey-5/assets/js/hello-frontend.min.js" = "$jsDir/hello-frontend.min.js"
    "wp-content/themes/dewey-5/assets/js/light-box/html5lightbox.js" = "$jsDir/html5lightbox.js"
    
    # FluentForm
    "wp-content/plugins/fluentform/assets/js/form-submission.js" = "$jsDir/fluent-form-submission.js"
    
    # Swiper slider
    "wp-content/plugins/elementor/assets/lib/swiper/v8/swiper.min.js" = "$jsDir/swiper.min.js"
}

foreach ($file in $jsFiles.GetEnumerator()) {
    $url = "$baseUrl/$($file.Key)"
    $output = $file.Value
    Download-Asset -Url $url -OutputPath $output
}

Write-Host "`n=== DOWNLOAD COMPLETE ===" -ForegroundColor Green
Write-Host "CSS files saved to: $cssDir" -ForegroundColor Cyan
Write-Host "JS files saved to: $jsDir" -ForegroundColor Cyan
