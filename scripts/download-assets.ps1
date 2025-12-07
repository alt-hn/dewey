# Script to download all external assets for homepage refactoring
# Run from project root: .\scripts\download-assets.ps1

$baseUrl = "https://thedeweyschools.edu.vn/wp-content/uploads"
$publicDir = "public/home/images"

# Create output directories if they don't exist
$dirs = @("slider", "logos", "features", "campuses", "programs", "infographics")
foreach ($dir in $dirs) {
    $path = Join-Path $publicDir $dir
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

Write-Host "Starting asset download..." -ForegroundColor Cyan

# Download function with retry logic
function Download-Asset {
    param(
        [string]$Url,
        [string]$OutputPath
    )
    
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

# Header/Footer Logos
Write-Host "`n=== LOGOS ===" -ForegroundColor Cyan
$logos = @{
    "2023/01/vp_vp-logo-dewey-02-1.svg" = "logos/dewey-logo.svg"
    "2023/02/logo-sakura-schools01.png" = "logos/sakura-logo.png"
    "2023/03/cis-schools-member-1.png" = "logos/cis-member.png"
    "2023/07/Logo-AP.png" = "logos/logo-ap.png"
    "2024/05/ib-logo.png" = "logos/ib-logo.png"
    "2023/07/Logo-The-Mount-Vernon-School.png" = "logos/mount-vernon.png"
}

foreach ($asset in $logos.GetEnumerator()) {
    $url = "$baseUrl/$($asset.Key)"
    $output = Join-Path $publicDir $asset.Value
    Download-Asset -Url $url -OutputPath $output
}

# Hero Slider Images
Write-Host "`n=== HERO SLIDER ===" -ForegroundColor Cyan
$sliders = @{
    "2025/09/tuyen-sinh-lop1-mobile.jpg" = "slider/tuyen-sinh-lop1-mobile.jpg"
    "2025/09/tuyen-sinh-lop1-website.jpg" = "slider/tuyen-sinh-lop1-desktop.jpg"
    "2025/10/hoc-bong-mastery-2526-mobile.jpg" = "slider/hoc-bong-mastery-mobile.jpg"
    "2025/10/hoc-bong-mastery-2526-website.jpg" = "slider/hoc-bong-mastery-desktop.jpg"
    "2025/11/cg-mastery-mobile.jpg" = "slider/cg-mastery-mobile.jpg"
    "2025/11/cg-mastery-web.jpg" = "slider/cg-mastery-desktop.jpg"
    "2025/09/tuyen-sinh-5-12-26-27-mobile.jpg" = "slider/tuyen-sinh-5-12-mobile.jpg"
    "2025/09/tuyen-sinh-5-12-26-27-website.jpg" = "slider/tuyen-sinh-5-12-desktop.jpg"
    "2025/09/tuyen-sinh-lop6-26-27-mobile.jpg" = "slider/tuyen-sinh-lop6-mobile.jpg"
    "2025/09/tuyen-sinh-lop6-26-27-website.jpg" = "slider/tuyen-sinh-lop6-desktop.jpg"
    "2025/09/tuyen-sinh-lop-10-26-27-mobile.jpg" = "slider/tuyen-sinh-lop10-mobile.jpg"
    "2025/09/tuyen-sinh-lop-10-website.jpg" = "slider/tuyen-sinh-lop10-desktop.jpg"
    "2025/09/tuyen-sinh-bo-sung-26-27-mobile.jpg" = "slider/tuyen-sinh-bosung-mobile.jpg"
    "2025/09/tuyen-sinh-bo-sung-26-27-website.jpg" = "slider/tuyen-sinh-bosung-desktop.jpg"
}

foreach ($asset in $sliders.GetEnumerator()) {
    $url = "$baseUrl/$($asset.Key)"
    $output = Join-Path $publicDir $asset.Value
    Download-Asset -Url $url -OutputPath $output
}

# Feature Icons
Write-Host "`n=== FEATURES ===" -ForegroundColor Cyan
$features = @{
    "elementor/thumbs/cis-logo-01-qifbekuscqgu5hrzk1tinlkguyg7r8wpkxgw7wqlkg.png" = "features/cis-logo.png"
    "elementor/thumbs/Mount-Vernon-School-qifbei1911iqo6s85yg1br7ph19ic48axl9w0uel2o.png" = "features/mount-vernon-feature.png"
    "elementor/thumbs/7-mon-hoc-qifbelslsdnvymmrk02jlq9jukqz6wn8a3vtxy90ds.png" = "features/7-mon-hoc.png"
    "elementor/thumbs/Design-Thinking-qifbekurljmln0o4phnx18i396vlz7jhxz8cgoaek0.png" = "features/design-thinking.png"
    "elementor/thumbs/Ca-nhan-hoa-qifbekurljmln0o4phnx18i396vlz7jhxz8cgoaek0.png" = "features/ca-nhan-hoa.png"
    "elementor/thumbs/du-hoc-My-qifbejwxeplbbephuz9agqqmnt08rifrlukuzebsq8.png" = "features/du-hoc-my.png"
    "elementor/thumbs/Moi-truong-quoc-te-qifbejwxeplbbephuz9agqqmnt08rifrlukuzebsq8.png" = "features/moi-truong-quoc-te.png"
    "elementor/thumbs/ren-luyen-kha-nang-qifbei1911iqo6s85yg1br7ph19ic48axl9w0uel2o.png" = "features/ren-luyen-kha-nang.png"
    "elementor/thumbs/Phat-trien-nang-khieu-qifbei1911iqo6s85yg1br7ph19ic48axl9w0uel2o.png" = "features/phat-trien-nang-khieu.png"
    "elementor/thumbs/Hoi-dong-Kh-SP-qifbejwxeplbbephuz9agqqmnt08rifrlukuzebsq8.png" = "features/hoi-dong-kh-sp.png"
}

foreach ($asset in $features.GetEnumerator()) {
    $url = "$baseUrl/$($asset.Key)"
    $output = Join-Path $publicDir $asset.Value
    Download-Asset -Url $url -OutputPath $output
}

# About Section
Write-Host "`n=== ABOUT ===" -ForegroundColor Cyan
Download-Asset -Url "$baseUrl/2023/03/gt.webp" -OutputPath (Join-Path $publicDir "infographics/gioi-thieu.webp")

# Infographics
Write-Host "`n=== INFOGRAPHICS ===" -ForegroundColor Cyan
$infographics = @{
    "2025/05/Con-so-biet-noi-mobile-458x600.jpg" = "infographics/con-so-mobile.jpg"
    "2025/05/trang-chu-mobile-1-scaled.jpg" = "infographics/trang-chu-mobile.jpg"
}

foreach ($asset in $infographics.GetEnumerator()) {
    $url = "$baseUrl/$($asset.Key)"
    $output = Join-Path $publicDir $asset.Value
    Download-Asset -Url $url -OutputPath $output
}

# Campus Images
Write-Host "`n=== CAMPUSES ===" -ForegroundColor Cyan
$campuses = @{
    "2023/03/Group-264.webp" = "campuses/cau-giay.webp"
    "2023/03/Group-267.webp" = "campuses/hai-phong.webp"
    "2023/03/Group-266.webp" = "campuses/tay-ho-tay.webp"
    "2023/03/Group-265.webp" = "campuses/ocean-park.webp"
}

foreach ($asset in $campuses.GetEnumerator()) {
    $url = "$baseUrl/$($asset.Key)"
    $output = Join-Path $publicDir $asset.Value
    Download-Asset -Url $url -OutputPath $output
}

# Program Banners
Write-Host "`n=== PROGRAMS ===" -ForegroundColor Cyan
$programs = @{
    "2023/06/chuongtrinhtichhopexplore.png" = "programs/explore.png"
    "2023/10/chuong-trinh-tich-hop-discover.png" = "programs/discover.png"
    "2023/10/chuong-trinh-quoc-te-adventure.png" = "programs/adventure.png"
}

foreach ($asset in $programs.GetEnumerator()) {
    $url = "$baseUrl/$($asset.Key)"
    $output = Join-Path $publicDir $asset.Value
    Download-Asset -Url $url -OutputPath $output
}

Write-Host "`n=== DOWNLOAD COMPLETE ===" -ForegroundColor Green
Write-Host "All assets saved to: $publicDir" -ForegroundColor Cyan
