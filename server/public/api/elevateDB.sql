-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 18, 2019 at 04:10 AM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wickedsales`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartItems`
--

CREATE TABLE `cartItems` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `productID` mediumint(8) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL,
  `price` mediumint(8) UNSIGNED NOT NULL,
  `added` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cartID` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cartItems`
--

INSERT INTO `cartItems` (`id`, `productID`, `count`, `price`, `added`, `updated`, `cartID`) VALUES
(1, 2, 2, 2595, '2019-10-16 04:08:06', '2019-10-18 03:34:57', 1),
(3, 1, 2, 2999, '2019-10-18 03:35:04', '2019-10-18 03:35:15', 1),
(5, 4, 1, 999, '2019-10-18 03:54:21', '2019-10-18 03:54:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `img_url` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `img_url`, `product_id`) VALUES
(1, './images/backpack-1.jpg', 1),
(2, './images/backpack-2.jpg', 1),
(3, './images/binoculars-1.jpeg', 2),
(4, './images/binoculars-2.png', 2),
(5, './images/camelbak-1.jpeg', 3),
(6, './images/camelbak-2.jpeg', 3),
(7, './images/flashlight-1.jpeg', 4),
(8, './images/flashlight-2.jpeg', 4),
(9, './images/headlamp-1.jpg', 5),
(10, './images/headlamp-2.jpg', 5),
(11, './images/sleeping-bag-1.jpeg', 6),
(12, './images/sleeping-bag-2.jpg', 6),
(13, './images/tent-1.jpeg', 7),
(14, './images/tent-2.jpeg', 7),
(15, './images/tent-2.jpg', 7),
(16, './images/trekking-poles-1.jpeg', 8),
(17, './images/trekking-poles-2.jpg', 8),
(18, './images/water-bottle-1.jpeg', 9),
(19, './images/water-bottle-2.jpeg', 9),
(20, './images/water-pump-1.jpeg', 10),
(21, './images/water-pump-2.jpeg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `price` mediumint(8) UNSIGNED NOT NULL,
  `shortDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `longDescription` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `shortDescription`, `longDescription`) VALUES
(1, 'Osprey Backpack', 2999, 'Space for all your needs without all the weight!', 'Manmade\nImported\nIntegrated raincover keeps your pack and gear dry in inclement weather\nInternal hydration sleeve accommodates up to a 3L reservoir\nScratch resistant organization pocket for sunglasses and electronics\nStretch mesh side pockets for storing smaller items\nTrekking pole attachment with upper compression strap capture'),
(2, 'Nikon Binoculars', 2595, 'See beyond your limits', '8x power magnifies objects without sacrificing field of view or exit pupil\n42mm objective lenses improve light-gathering ability without adding excessive bulk or weight\nHigh-reflectivity silver-alloy prism coatings reduce internal diffraction to further improve light transmission and contrast\nWide 5.25mm exit pupil will completely cover most pupils as they open and dilate in low light to keep the full scene in view\nObjective lens caps can be clipped to neck strap to avoid losing them during observation sessions'),
(3, 'Camelbak', 2900, 'Hydration without the hassle', 'plastic\nMade in the USA\nOffers 20% more water per sip. Lumbar design shifts water weight to your lower back for more stability on the trail\nLeak-proof cap is easier to open and close\nOn/off lever lets you seal your drinking tube shut with one hand\nHydro guard technology inhibits the growth of bacteria in the reservoir and tube\nBig bite valve self-seals after each drink, eliminating annoying drips'),
(4, 'Mini Maglite ', 999, 'Light your way without the weight', 'Superior quality craftsmanship with weather-resistant seal, diamond knurl design, and anodized inside and out for improved corrosion resistance\nCompact design renowned for its quality, durability, and reliability\nMade in America and built tough enough to last a lifetime making it suitable for camping, car repairs, climbing, dog walking, fishing, household use, hunting, etc.\nIncludes a spare lamp safely secured in the tail cap and converts quickly into free standing candle mode, for convenient, hands-free light whenever you need it\nAdjustable and powerful lighting instrument that makes a useful gift and fits perfectly into pockets, purses, attaché cases, etc.'),
(5, 'Headlamp', 9900, 'Hands-free guiding light', '200 LUMEN, MULTI-FUNCTIONAL HEADLAMP - This bright, comfortable headlamp features multiple modes, red and white LEDs, and is water resistant\nMULTI-MODE HEADLAMP WITH WHITE + RED LEDs - This headlight can be set to High, Low, Flood, or Red LED modes\nEASY TO USE MULTI-MODE SWITCH - The central switch can be used to access the three white LED modes, or simply press and hold for red\nDURABLE + WEATHER RESISTANT - The Radiant 200 Headlamp is drop proof to 2 meters and is weather resistant\nCOMFORTABLE HEADLAMP FOR ALL AROUND USE - The high quality elastic strap, 90° adjustable tilt angle, and the lightweight, durable body make this your go-to all around headlamp\nWORRY-FREE GUARANTEE - all Nite Ize products are backed by our Worry-Free Guarantee'),
(6, 'Nemo Sleeping Bag', 830, 'Rustic comfort', 'Unlike mummy bags, the Viola offers extra room at the elbows and knees for side sleeping or changing sleeping positions throughout the night\nThermo Gills™ extend the temperature range of your bag on milder nights, allowing you to unzip and let heat out without letting cold drafts in\nThe Blanket Fold™ is a unique NEMO feature that can be tucked in like a draft collar, or flipped out to release heat from the bag\nSynthetic insulation offers a terrific blend of warmth, moisture resistance and packed volume\nIntegrated pillow pocket allows a jacket, extra clothes or a NEMO Fillo™ pillow (sold separately) to be stuffed into the sleeve opening for a handy pillow on the go\nZippered stash pocket keeps your phone or other essentials warm and within reach\nFull-length, double-slider zipper with snag guard built into the draft tube makes getting in and out of the bag a breeze\nIncludes a nylon compression stuff sack and a mesh storage bag'),
(7, 'Hiking Tent', 38000, '2 person camping tent', 'Large doors and trapezoidal vestibules with multiple roll-back points provide customizable storage and ease of entry\nHubbed, pre-bent DAC Featherlite poles with high-arching main pole significantly increase volume at the head, peak and foot ends\nColor-coded anodized poles and matched webbing make for an intuitive setup\nBlack no-see-um mesh sidewalls provide significant airflow for condensation and temperature control—and clear stargazing at night\nIntegrated 20-denier nylon tub provides an ultralight, waterproof floor; add the Dragonfly 2 footprint (not included) for additional protection\nPremium 15-denier ripstop nylon fly is coated in a durable silicone repellent for reliable and durable weather protection\nOverhead Light Pockets™ use special light-diffusing fabric to cast an even glow with a headlamp (headlamp not included)\nGear Pockets™ offer storage for personal items\nDivvy™ Sack dual-stage stuff sack allows you to split the load with a hiking partner\nProtected strut vents at the top of each zipper flap ensure greater ventilation, especially during a storm\nSingle-seam tub construction and silicone-impregnated fabrics offer increased longevity'),
(8, 'Trekking Poles', 8595, 'Helpful tools for your hiking needs', '3-section poles provide patented FlickLock adjustability with \"zero-slip\" security\nSimply flick the lock open, set the length and flick it closed to lock tight—a quick, easily accomplished task, even while wearing gloves\nSoft, dual-density foam grips and extensions have padded wrist straps for security\nPoles extend 25 - 55 in.\nIncludes low-profile baskets for general use and powder baskets for use in the snow'),
(9, 'Water Bottle', 1799, 'Meeting your hydration needs', 'Ergonomic shape ensures 1-handed ease while drinking and carrying\nTempShield™ double-wall vacuum insulation keeps contents cold up to 24 hrs. or hot up to 6 hrs.\nStainless-steel construction is BPA-free and features a proprietary powder coat\nFlow control spout\nCovered by a Hydro Flask lifetime warranty'),
(10, 'Water Pump', 8995, 'Never run out of clean water', 'Ceramic/carbon Marathon™ EX element effectively removes bacteria and protozoa including giardia and cryptosporidia\nAlso removes unpleasant tastes and odors caused by organic compounds, such as iodine, chlorine and pesticides\nFilter can be cleaned over and over for maximum field life with no tools required\nAirSpring Accumulator™ increases filtration speed up to 1 liter per min.\nBottom screws onto an MSR Dromedary® Bag or Nalgene® water bottle for easy operation (both sold separately)\nEasy disassembly lets you troubleshoot and maintain the MSR MiniWorks EX filter in the field');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cartItems`
--
ALTER TABLE `cartItems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cartproductid` (`productID`,`cartID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cartItems`
--
ALTER TABLE `cartItems`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
