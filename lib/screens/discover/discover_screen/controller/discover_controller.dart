import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/mixin/state_bottom_sheet_mixin.dart';
import 'package:get/get.dart';

import '../../../../app/components/dialog/loading_progress.dart';
import '../../../../app/constants/app/app_constant.dart';
import '../../../../app/constants/enum/loading_status_enum.dart';
import '../../../../app/model/response/discover_response_model.dart';

class DiscoverController extends GetxController with StateBottomSheetMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  BuildContext get context => scaffoldKey.currentContext!;  

  final pageController = PageController();

  final Rx<LoadingStatus> _loadingStatus = Rx(LoadingStatus.Init);
  final Rx<List<DiscoverResponseModel>> _discovers = Rx([]);
  final Rx<int> _currentScreenIndex = 0.obs;


  LoadingStatus get loadingStatus => _loadingStatus.value;
  set loadingStatus(LoadingStatus value) => _loadingStatus.value = value;
  
  List<DiscoverResponseModel> get discovers => _discovers.value;
  set discovers(List<DiscoverResponseModel> value) => _discovers.value = value;

  int get currentScreenIndex => _currentScreenIndex.value;
  set currentScreenIndex(int value) => _currentScreenIndex.value = value;


  @override
  void onReady() async {
    super.onReady();
    try {
      loadingStatus = LoadingStatus.Loading;
      LoadingProgress.start();
      await getDiscoverDatas();
      loadingStatus = LoadingStatus.Loaded;
      LoadingProgress.stop();
    } catch (e) {
      loadingStatus = LoadingStatus.Error;
      LoadingProgress.stop();
      showErrorStateBottomSheet(message: e.toString(), onTapFirstBtn: onTapTryAgain);
    }
  }

  void onPageChange(int index) => currentScreenIndex = index;

   void onTapNextScreen() async {
    if (currentScreenIndex == 49) {
      pageController.jumpToPage(0);
    } else {
      pageController.nextPage(
        duration: animationDurationMS,
        curve: Curves.ease,
      );
    }
  }


   Future<void> getDiscoverDatas() async {
    // final response = await General().allLegalList();
    // if (response.status == BaseModelStatus.Ok) {
    //   legals = response.data!;
    // } else {
    //   throw AppException(response.message ?? AppLocalization.getLabels.defaultErrorMessage);
    // }
    await Future.delayed(const Duration(seconds: 2));
    discovers = constantDiscovers.map((e) => DiscoverResponseModel().fromJson(e)).toList();
    discovers.shuffle();
  }


    void onTapTryAgain() {
    Navigator.pop(context);
    onReady();
  }

}



List<Map<String,dynamic>> constantDiscovers =[
  {
    "title": "Historical Emissions",
    "content": "The industrial revolution in the 18th century marked the beginning of significant carbon emissions. As industries expanded and fossil fuels became a primary energy source, carbon dioxide levels in the atmosphere began to rise, contributing to the greenhouse effect and global warming."
  },
  {
    "title": "Largest Carbon Emitters",
    "content": "China is the world's largest carbon emitter, responsible for a substantial portion of global carbon dioxide emissions. The United States follows closely, with India also emerging as a significant contributor to carbon emissions due to its large population and rapid economic growth."
  },
  {
    "title": "Carbon Intensity of Food",
    "content": "The carbon footprint of food varies significantly depending on its source. Meat production, particularly beef and lamb, has a much higher carbon footprint compared to plant-based foods like vegetables and grains. Choosing a diet rich in plant-based foods can substantially reduce an individual's carbon footprint."
  },
  {
    "title": "Role of Transportation",
    "content": "Transportation is a major contributor to carbon emissions worldwide. Cars, trucks, and airplanes are among the primary culprits. The combustion of fossil fuels in internal combustion engines releases carbon dioxide into the atmosphere. Transitioning to electric vehicles and investing in public transportation systems can help mitigate this impact."
  },
  {
    "title": "Carbon Footprint of Clothing",
    "content": "The fashion industry is responsible for a substantial carbon footprint due to the phenomenon of fast fashion, which encourages rapid turnover of clothing items. Additionally, the production of synthetic fabrics and dyes contributes to environmental pollution and emissions. Sustainable fashion practices and choosing quality, long-lasting clothing items can help reduce this footprint."
  },
  {
    "title": "Carbon Offsetting",
    "content": "Carbon offset programs allow individuals and organizations to compensate for their carbon emissions by supporting projects that either reduce or capture carbon dioxide from the atmosphere. These projects can include reforestation, renewable energy installations, and methane capture from landfills. Carbon offsetting is a strategy to achieve carbon neutrality."
  },
  {
    "title": "Carbon Tax",
    "content": "Some countries have implemented carbon taxes as a policy tool to encourage emissions reduction. Carbon taxes impose a fee on the carbon content of fossil fuels, effectively internalizing the cost of carbon emissions. The revenue generated from carbon taxes can fund renewable energy projects and climate mitigation efforts."
  },
  {
    "title": "Renewable Energy Transition",
    "content": "Transitioning from fossil fuels to renewable energy sources like solar, wind, and hydropower is a critical step in reducing the carbon footprint of energy production. Renewable energy technologies generate electricity with minimal or no direct carbon emissions, making them a sustainable alternative to fossil fuels."
  },
  {
    "title": "Carbon Footprint of Electronics",
    "content": "The production, use, and disposal of electronic devices contribute to their carbon footprint. Manufacturing electronic components, such as semiconductors and circuit boards, consumes energy and raw materials. Proper recycling and responsible disposal of electronics can mitigate their environmental impact."
  },
  {
    "title": "Urbanization Impact",
    "content": "Urban areas tend to have higher per capita carbon footprints compared to rural areas due to concentrated populations, increased energy use, and transportation demands. Urban planning that promotes sustainability, public transportation, and energy efficiency can help reduce the carbon footprint of cities."
  },
  {
    "title": "Carbon Footprint of Air Travel",
    "content": "Long-haul flights can have a substantial carbon footprint due to the significant fuel consumption required for aviation. The aviation industry is exploring options like biofuels and more fuel-efficient aircraft to reduce emissions. Travelers can also consider carbon offsetting when flying to mitigate their impact."
  },
  {
    "title": "Carbon Footprint of Shipping",
    "content": "The shipping industry plays a crucial role in global trade, but it also has a significant carbon footprint. Large container ships and cargo vessels are powered by fossil fuels, emitting carbon dioxide and other pollutants. Innovations like hybrid propulsion systems and wind-assisted technology are being explored to make shipping more environmentally friendly."
  },
  {
    "title": "Carbon Footprint Reduction Apps",
    "content": "There are smartphone applications designed to help individuals track and reduce their carbon footprint. These apps provide information on carbon-intensive activities, offer carbon reduction tips, and suggest sustainable alternatives. They empower users to make more environmentally conscious choices in their daily lives."
  },
  {
    "title": "Carbon Footprint of Home Energy",
    "content": "Improving home insulation, using energy-efficient appliances, and adopting renewable energy sources can significantly lower the carbon footprint of households. Reducing energy consumption and opting for clean energy options like solar panels can both save money and reduce environmental impact."
  },
  {
    "title": "Carbon Footprint of Food Packaging",
    "content": "The carbon footprint of food products is influenced by packaging materials and practices. Excessive packaging contributes to environmental waste and increases the overall carbon footprint of food items. Sustainable packaging solutions, such as biodegradable materials and minimalist packaging, can help mitigate this impact."
  },
  {
    "title": "Carbon Footprint of Water Usage",
    "content": "The treatment and distribution of water require energy, which adds to the carbon footprint of water usage. Reducing water waste, improving water treatment efficiency, and optimizing distribution systems can lower the carbon footprint associated with providing clean and safe drinking water."
  },
  {
    "title": "Carbon Footprint of Deforestation",
    "content": "Deforestation contributes to carbon emissions because trees store carbon dioxide. When forests are cleared for agriculture, urban development, or logging, this stored carbon is released into the atmosphere, exacerbating the greenhouse effect. Reforestation and sustainable forestry practices are essential for mitigating this impact."
  },
  {
    "title": "Carbon Footprint of Recycling",
    "content": "Recycling materials like paper, glass, and aluminum can reduce carbon emissions compared to manufacturing products from raw materials. Recycling conserves energy, reduces resource extraction, and minimizes the environmental impact of waste disposal. Encouraging recycling is an important part of sustainable waste management."
  },
  {
    "title": "Carbon Footprint of Virtual Meetings",
    "content": "Remote meetings conducted through video conferencing platforms can have a smaller carbon footprint compared to in-person gatherings. By eliminating the need for travel, virtual meetings reduce emissions from transportation and conferencing facilities. This is especially relevant in an increasingly interconnected global economy."
  },
  {
    "title": "Carbon Footprint of Fast Fashion",
    "content": "The fast fashion industry's short product lifecycle and high turnover of clothing items contribute to its substantial carbon footprint. Additionally, the production of synthetic fabrics and the use of energy-intensive dyeing processes increase emissions. Sustainable fashion practices, such as ethical sourcing and durable designs, aim to address these issues."
  },
  {
    "title": "Carbon Footprint of Food Transportation",
    "content": "The distance that food travels to reach consumers can significantly impact its carbon footprint. Food products transported long distances by trucks, ships, or planes generate more emissions compared to locally sourced items. Supporting local and seasonal food options can help reduce this transportation-related carbon footprint."
  },
  {
    "title": "Carbon Footprint of Veganism",
    "content": "A vegan diet generally has a lower carbon footprint compared to an omnivorous one. This is because plant-based diets typically require fewer resources, such as land and water, and produce fewer greenhouse gas emissions compared to diets that rely heavily on animal products. Choosing plant-based foods can be an effective way to reduce one's carbon footprint."
  },
  {
    "title": "Carbon Footprint of Construction",
    "content": "The construction industry is a major emitter of carbon dioxide due to the energy-intensive processes involved in building infrastructure and structures. The production of construction materials like cement and steel also contributes to emissions. Sustainable construction practices, such as using eco-friendly materials and designing energy-efficient buildings, can help mitigate this impact."
  },
  {
    "title": "Carbon Footprint of Data Centers",
    "content": "Data centers, which power the internet and store vast amounts of digital information, consume a significant amount of energy. Cooling systems, servers, and data storage facilities all contribute to the carbon footprint of data centers. Companies are increasingly adopting energy-efficient data center designs and renewable energy sources to reduce their environmental impact."
  },
  {
    "title": "Carbon Footprint of Single-Use Plastics",
    "content": "Single-use plastics are problematic due to their carbon footprint and environmental impact. The production of plastics from fossil fuels releases greenhouse gases, and improper disposal leads to plastic pollution. Reducing single-use plastic consumption, promoting recycling, and exploring alternative materials are key strategies for addressing this issue."
  },
  {
    "title": "Carbon Footprint of Electricity Grids",
    "content": "The carbon footprint of electricity generation varies depending on the energy mix of the grid. Grids powered by fossil fuels have a higher carbon intensity, while those primarily using renewable energy sources produce fewer emissions. Transitioning to cleaner energy sources and improving grid efficiency are essential steps toward reducing the carbon footprint of electricity."
  },
  {
    "title": "Carbon Footprint of Livestock",
    "content": "Raising livestock for meat and dairy production is a major contributor to carbon emissions. The carbon footprint of livestock includes factors like land use, feed production, methane emissions from digestion, and manure management. Sustainable agricultural practices and dietary choices, such as reducing meat consumption, can help address this issue."
  },
  {
    "title": "Carbon Footprint of Carbon Capture",
    "content": "Developing carbon capture and storage (CCS) technologies is a critical step in reducing emissions from industries that are challenging to decarbonize, such as cement and steel production. CCS involves capturing carbon dioxide emissions at their source and either storing them underground or utilizing them in various industrial processes. CCS can play a significant role in achieving emission reduction goals."
  },
  {
    "title": "Carbon Footprint of Bicycling",
    "content": "Bicycling is an eco-friendly mode of transportation with a minimal carbon footprint. Unlike cars, bicycles produce no direct emissions and require no fossil fuels to operate. Promoting cycling infrastructure and encouraging bicycle commuting can contribute to reduced carbon emissions from transportation."
  },
  {
    "title": "Carbon Footprint of Carbon Pricing",
    "content": "Carbon pricing mechanisms aim to internalize the cost of carbon emissions in goods and services. By placing a price on carbon, either through carbon taxes or emissions trading systems (cap-and-trade), businesses and individuals are incentivized to reduce their carbon emissions. Carbon pricing is a market-based approach to addressing climate change."
  },
  {
    "title": "Carbon Footprint of Meat Alternatives",
    "content": "Plant-based meat alternatives, such as veggie burgers and tofu, have a lower carbon footprint compared to traditional meat products. These alternatives typically require fewer resources and generate fewer greenhouse gas emissions during production. Incorporating more plant-based options into diets can help reduce the environmental impact of food consumption."
  },
  {
    "title": "Carbon Footprint of Ocean Shipping",
    "content": "Container ships and bulk carriers used in ocean shipping are responsible for a significant portion of global carbon emissions. These vessels rely on heavy fuel oils, emitting carbon dioxide and other pollutants. Efforts to make shipping more environmentally friendly include the adoption of cleaner fuels, improved engine technology, and wind-assisted propulsion systems."
  },
  {
    "title": "Carbon Footprint of Hydropower",
    "content": "Hydropower is a renewable energy source with a relatively low carbon footprint. Hydropower plants generate electricity by harnessing the energy of flowing water, with minimal direct emissions. However, the construction of large dams can have environmental and social impacts, and it's essential to assess these trade-offs when considering hydropower projects."
  },
  {
    "title": "Carbon Footprint of Electric Cars",
    "content": "Electric cars (EVs) produce fewer emissions compared to traditional gasoline-powered vehicles. EVs use electricity, which can be generated from renewable sources, reducing their carbon footprint. The widespread adoption of electric vehicles is a key strategy for reducing emissions from the transportation sector."
  },
  {
    "title": "Carbon Footprint of Reforestation",
    "content": "Reforestation efforts involve planting trees and restoring forests, which can help capture carbon and mitigate climate change. Trees absorb carbon dioxide from the atmosphere and store it in their biomass and soil. Reforestation projects are essential for sequestering carbon and enhancing biodiversity."
  },
  {
    "title": "Carbon Footprint of Public Transportation",
    "content": "Public transportation systems, such as buses and trains, can significantly reduce the carbon footprint of urban commuters. Mass transit systems are generally more energy-efficient per passenger mile compared to individual car travel. Expanding and improving public transportation infrastructure is a sustainable solution for reducing traffic congestion and emissions in cities."
  },
  {
    "title": "Carbon Footprint of Nuclear Energy",
    "content": "Nuclear power is a low-carbon energy source that generates electricity with minimal direct carbon emissions. Nuclear reactors use nuclear fission to produce heat, which is then converted into electricity. While nuclear energy is considered a low-carbon option, it presents challenges related to safety, waste management, and public perception."
  },
  {
    "title": "Carbon Footprint of Meat Production",
    "content": "Meat production is associated with a substantial carbon footprint due to various factors. These include the land required for grazing and feed production, methane emissions from livestock digestion, and energy-intensive processes in meat processing. Sustainable agricultural practices and dietary choices that reduce meat consumption can contribute to lowering this footprint."
  },
  {
    "title": "Carbon Footprint of Biofuels",
    "content": "Biofuels are an alternative to traditional fossil fuels and can offer a lower-carbon option for transportation and energy generation. Biofuels are derived from organic materials, such as crops, algae, or waste products, and can be used in vehicles, airplanes, and power plants. However, the sustainability of biofuels depends on factors like feedstock choice and land use practices."
  },
  {
    "title": "Carbon Footprint of Methane Leakage",
    "content": "Methane leakage from natural gas infrastructure contributes to the carbon footprint of this energy source. Methane is a potent greenhouse gas, and its release during the extraction, transportation, and distribution of natural gas can significantly impact the environment. Reducing methane emissions is crucial for mitigating the carbon footprint of natural gas."
  },
  {
    "title": "Carbon Footprint of Carbon Neutrality",
    "content": "Achieving carbon neutrality involves balancing emissions with carbon removal or offsetting. Organizations and individuals strive to reduce their carbon emissions to as close to zero as possible and then compensate for any remaining emissions by investing in carbon offset projects. Carbon neutrality is a critical goal in the fight against climate change."
  },
  {
    "title": "Carbon Footprint of Solar Panels",
    "content": "The production, installation, and disposal of solar panels impact their overall carbon footprint. While solar panels generate clean, renewable energy during their operational life, the energy and materials used in their manufacturing can contribute to emissions. However, the long-term benefits of solar power in reducing carbon emissions far outweigh the initial footprint."
  },
  {
    "title": "Carbon Footprint of Rainforests",
    "content": "Deforestation in rainforests releases stored carbon and disrupts the global carbon cycle. Rainforests, like the Amazon, are crucial carbon sinks, absorbing vast amounts of carbon dioxide. When these forests are cleared for agriculture, logging, or urban development, the carbon stored in trees is released into the atmosphere, contributing to global warming."
  },
  {
    "title": "Carbon Footprint of Carbon Markets",
    "content": "Carbon markets facilitate the buying and selling of carbon credits to reduce emissions. Businesses and governments can purchase carbon credits from projects that reduce or capture carbon dioxide, such as reforestation initiatives or renewable energy projects. Carbon markets create economic incentives for emissions reduction and play a role in addressing climate change."
  },
  {
    "title": "Carbon Footprint of Landfills",
    "content": "Landfills emit methane gas, contributing to their carbon footprint. Organic waste in landfills undergoes anaerobic decomposition, producing methane, a potent greenhouse gas. Landfill emissions can be reduced through methane capture systems, composting, and waste-to-energy technologies."
  },
  {
    "title": "Carbon Footprint of Energy Efficiency",
    "content": "Improving energy efficiency in buildings, industries, and transportation can significantly reduce carbon emissions. Energy efficiency measures include better insulation, energy-efficient appliances, and more efficient transportation systems. Reducing energy waste not only lowers carbon footprints but also leads to cost savings and sustainability benefits."
  },
  {
    "title": "Carbon Footprint of Forest Fires",
    "content": "Forest fires release large amounts of carbon dioxide into the atmosphere. When wildfires burn through forests, the carbon stored in trees and vegetation is released as carbon dioxide. The increasing frequency and intensity of wildfires due to climate change are contributing to higher atmospheric carbon dioxide levels."
  },
  {
    "title": "Carbon Footprint of Carbon Labels",
    "content": "Carbon labels on products provide consumers with information about their environmental impact. These labels quantify the carbon footprint associated with a product's lifecycle, from production to disposal. Carbon labeling helps consumers make informed choices and encourages businesses to reduce their products' carbon emissions."
  },
  {
    "title": "Carbon Footprint of Green Buildings",
    "content": "Green building practices aim to minimize energy use and carbon emissions in construction. This includes designing and constructing buildings with energy-efficient features, sustainable materials, and renewable energy sources. Green buildings often achieve LEED (Leadership in Energy and Environmental Design) certification, demonstrating their commitment to environmental sustainability."
  },
  {
    "title": "Carbon Footprint of Carbon Sequestration",
    "content": "Carbon sequestration involves capturing and storing carbon dioxide to reduce its atmospheric concentration. This can be achieved through various methods, such as afforestation and reforestation, soil carbon sequestration, and direct air capture. Carbon sequestration technologies are essential tools in efforts to combat climate change and reduce carbon emissions."
  }
];