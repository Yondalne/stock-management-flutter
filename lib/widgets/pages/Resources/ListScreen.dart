import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_management/controllers/resource.dart';
import 'package:stock_management/models/resource.dart';
import 'package:stock_management/widgets/components/MyPageTitle.dart';
import 'package:stock_management/models/category.dart';

// import 'package:stock_management/widgets/components/ResourceListElement.dart';

class ResourceList extends StatelessWidget {
  final ResourceController resourceController = ResourceController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            PageTitle(title: "Resources List", routeName: "/resource/create"),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                resourceController.fetchResources();
              },
              child: Text('Fetch Resources'),
            ),
            SizedBox(height: 10),
            Obx(
              () {
                final List<Resource> resources = resourceController.resources;
                if (resources.isEmpty) {
                  return Text('No resources available');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: resources.length,
                      itemBuilder: (context, index) {
                        final Resource resource = resources[index];
                        return Card(
                          child: InkWell(
                            onTap: () {
                              // Redirigez ici vers la page souhaitée lorsque l'élément est cliqué
                              Navigator.pushNamed(context, '/resource/details',
                                  arguments: resource);
                            },
                            child: ListTile(
                              title: Text(resource.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(resource.description),
                                  Wrap(
                                    spacing: 4.0, // Espace entre les puces
                                    children: [
                                      for (final Category category
                                          in resource.categories)
                                        Chip(
                                          label: Text(category.label),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      style: ButtonStyle(),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/resource/show',
                                            arguments: resource);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red[500],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      onPressed: () {
                                        resourceController
                                            .deleteResource(resource.id);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
